class Crawls < ActiveRecord::Base

  @cities={"Chicago, IL" => [-88.210602,41.553811,-87.400360,42.259016],

# "Atlanta, GA" => [-84.541855,33.605470,-84.092789,34.018518],
           "New York City" => [-74.509277,40.283811,-73.664703,41.957086]}
#          "San Francisco, CA" => [-123.042755,37.302460,-121.828766,38.195022],
#          "Denver, CO" => [-107.385864,38.548165,-103.705444,40.497092],
#          "Tampa, FL" => [-87.121582,24.447150,-79.167480,30.939924],
#          "Austin, TX" => [-99.777832,28.883160,-94.240723,33.504759],
#          "Seattle, WA" => [-125.529785,47.129951,-120.563965,49.696062]}
  def self.get_region_stats(word,region)
    Crawls.select(:tweet).where("region = ? AND tweet LIKE ?",region.to_s, '% '+word.to_s+' %')
  end

  def self.tweet_pruner
    while(true) do
      Crawls.destroy_all(['updated_at < ?', 2.hours.ago])
      sleep 60
    end
  end
  
#Chicago: -88.210602,41.553811,-87.400360,42.259016
#New York: -88.210602,40.553811,-73.664703,41.957086
#Atlanta: -84.541855,33.605470,-84.092789,34.018518
#Florida: -87.121582,24.447150,-79.167480,30.939924
#Colorado: -107.385864,38.548165,-103.705444,40.497092
#Seattle: -125.529785,47.129951,-120.563965,49.696062
#Texas: -99.777832,28.883160,-94.240723,33.504759
#San Francisco: -123.042755,37.302460,-121.828766,38.195022

  def self.farm(formal_region, test)
    TweetStream.configure do |config|
	    if((formal_region <=> "New York, NY")==0) then
        config.consumer_key       = 'ZneZXyg6wdi3qo5ykwF76g'
  	    config.consumer_secret    = 'tfTLvYq0vG5E3EtSKl48rhYrT71pxhwdZREMfEFtYw'
  	    config.oauth_token        = '1336836626-4VqaDyXbic4h1mf6R6KDmnSg6ioKEPbBed5StJQ'
  	    config.oauth_token_secret = 'YxXHb7vC1MTXHw3A1hKCTThSmmDBdAISCYTuRukSaA'
  	    config.auth_method        = :oauth
      end
      if((formal_region <=> "Chicago, IL")==0) then
        config.consumer_key       = '5OmFa8Q9WdwgQZvgDU6UQw'
        config.consumer_secret    = 'UVhqq9IA9JzAZVQ16hfnFNwvtZv938CyocXD4p2WfA0'
        config.oauth_token        = '226011159-IcjiDKMb9iTQRNEyclshX3kVicnKePgUS9aNrVRS'
        config.oauth_token_secret = 'abY4hhz4tzYrvxbgaGkTaMVFxggU2HrTrQhE8PTNo'
        config.auth_method        = :oauth
      end
	  end
    region = formal_region.to_s.rpartition(',')[0].strip
    client = TweetStream::Client.new
    client.on_error do |error|
        puts error.to_s
    end
    client.on_limit do |messg|
        puts region+" limit: "+messg.to_s
    end
    if(!test) then
      client.locations(@cities[formal_region][0],@cities[formal_region][1],@cities[formal_region][2],@cities[formal_region][3]) do |status|
        puts region
        puts status.text
        Crawls.create :region => region, :tweet => status.text
      end
    end
  end

  def self.cities
    @cities.keys
  end

end

#jakes twitter shit
#config.consumer_key       = '5OmFa8Q9WdwgQZvgDU6UQw'
#config.consumer_secret    = 'UVhqq9IA9JzAZVQ16hfnFNwvtZv938CyocXD4p2WfA0'
#config.oauth_token        = '226011159-IcjiDKMb9iTQRNEyclshX3kVicnKePgUS9aNrVRS'
#config.oauth_token_secret = 'abY4hhz4tzYrvxbgaGkTaMVFxggU2HrTrQhE8PTNo'
#config.auth_method        = :oauth

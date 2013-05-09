class Crawls < ActiveRecord::Base
#  require 'tweetstream'
#  require 'rubygems'
  require 'twitter'
  @tweet_array = nil
  @cities = Hash.new
  @cities={"Chicago" => [-88.210602,41.553811,-87.400360,42.259016],
           "Atlanta" => [-84.541855,33.605470,-84.092789,34.018518],
           "New York" => [-74.509277,40.283811,-73.664703,41.957086],
           "San Francisco" => [-123.042755,37.302460,-121.828766,38.195022],
           "Denver" => [-107.385864,38.548165,-103.705444,40.497092],
           "Florida" => [-87.121582,24.447150,-79.167480,30.939924],
           "Texas" => [-99.777832,28.883160,-94.240723,33.504759],
           "Seattle" => [-125.529785,47.129951,-120.563965,49.696062]}
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

  def self.farm(region)
    TweetStream.configure do |config|
	    if(1 == 2) then
        config.consumer_key       = 'vodV1JZIlq0GjXz5I2Wg'
  	    config.consumer_secret    = 'Z3wKtYy0kjiKhbPRF1PbDWylDFoOr6HarMR5XqxzWg'
  	    config.oauth_token        = '1336836626-4VqaDyXbic4h1mf6R6KDmnSg6ioKEPbBed5StJQ'
  	    config.oauth_token_secret = 'YxXHb7vC1MTXHw3A1hKCTThSmmDBdAISCYTuRukSaA'
  	    config.auth_method        = :oauth
      end
      if(1 == 1) then
        config.consumer_key       = '5OmFa8Q9WdwgQZvgDU6UQw'
        config.consumer_secret    = 'UVhqq9IA9JzAZVQ16hfnFNwvtZv938CyocXD4p2WfA0'
        config.oauth_token        = '226011159-IcjiDKMb9iTQRNEyclshX3kVicnKePgUS9aNrVRS'
        config.oauth_token_secret = 'abY4hhz4tzYrvxbgaGkTaMVFxggU2HrTrQhE8PTNo'
        config.auth_method        = :oauth
      end
	  end
    client = TweetStream::Client.new
    client.on_error do |error|
        puts error.to_s
    end
    client.on_limit do |messg|
        puts region+" limit: "+messg.to_s
    end
    client.locations(@cities[region][0],@cities[region][1],@cities[region][2],@cities[region][3]) do |status|
      puts region
      puts status.text
      Crawls.create :region => region, :tweet => status.text
    end
  end
  def self.farm_gooder
#    Twitter.configure do |config|
#     config.consumer_key= 'ZneZXyg6wdi3qo5ykwF76g'
#	    config.consumer_secret= 'tfTLvYq0vG5E3EtSKl48rhYrT71pxhwdZREMfEFtYw'
#     config.oauth_token= '1336836626-4VqaDyXbic4h1mf6R6KDmnSg6ioKEPbBed5StJQ'
#     config.oauth_token_secret= 'YxXHb7vC1MTXHw3A1hKCTThSmmDBdAISCYTuRukSaA'
      #config.auth_method        = :oauth
#     config.consumer_key       = '5OmFa8Q9WdwgQZvgDU6UQw'
#     config.consumer_secret    = 'UVhqq9IA9JzAZVQ16hfnFNwvtZv938CyocXD4p2WfA0'
#     config.oauth_token        = '226011159-IcjiDKMb9iTQRNEyclshX3kVicnKePgUS9aNrVRS'
#     config.oauth_token_secret = 'abY4hhz4tzYrvxbgaGkTaMVFxggU2HrTrQhE8PTNo'
#   end
    puts "------------"
    puts Twitter.methods
    puts "------------"
    user = Twitter.user('bot_evan')
    puts user.method_names
    puts user.tweet_count
    puts Twitter::Client.new

# twitter = Twitter::Search.new
#   while(true)
#     results = twitter.containing("why")
#     results.each do |stati|
#       puts stati.text
#     end
#   end
  end

  def self.cities
#puts    Crawls.select(:region).region
    ['Chicago','Atlanta']     
    
  end


end
#jakes twitter shit
#config.consumer_key       = '5OmFa8Q9WdwgQZvgDU6UQw'
#config.consumer_secret    = 'UVhqq9IA9JzAZVQ16hfnFNwvtZv938CyocXD4p2WfA0'
#config.oauth_token        = '226011159-IcjiDKMb9iTQRNEyclshX3kVicnKePgUS9aNrVRS'
#config.oauth_token_secret = 'abY4hhz4tzYrvxbgaGkTaMVFxggU2HrTrQhE8PTNo'
#config.auth_method        = :oauth

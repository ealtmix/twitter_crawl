class Crawls < ActiveRecord::Base
  require 'tweetstream'
  require 'rubygems'

  def self.get_region_stats(word,region)
    Crawls.where("region = ? AND tweet LIKE ?",region.to_s, '%'+word.to_s+'%').all
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

  def self.farm(set,blat,blong,tlat,tlong,region)
    TweetStream.configure do |config|
	    if(set == 1) then
        config.consumer_key       = 'vodV1JZIlq0GjXz5I2Wg'
  	    config.consumer_secret    = 'Z3wKtYy0kjiKhbPRF1PbDWylDFoOr6HarMR5XqxzWg'
  	    config.oauth_token        = '1336836626-4VqaDyXbic4h1mf6R6KDmnSg6ioKEPbBed5StJQ'
  	    config.oauth_token_secret = 'YxXHb7vC1MTXHw3A1hKCTThSmmDBdAISCYTuRukSaA'
  	    config.auth_method        = :oauth
      end
      if(set ==2) then
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
    client.locations(blat.to_f,blong.to_f,tlat.to_f,tlong.to_f) do |status|
      puts region
      puts status.text
      Crawls.create :region => region, :tweet => status.text
    end
  end

  def self.cities
    Crawls.select_values("select distinct(region) from movies")
  end


end
#jakes twitter shit
#config.consumer_key       = '5OmFa8Q9WdwgQZvgDU6UQw'
#config.consumer_secret    = 'UVhqq9IA9JzAZVQ16hfnFNwvtZv938CyocXD4p2WfA0'
#config.oauth_token        = '226011159-IcjiDKMb9iTQRNEyclshX3kVicnKePgUS9aNrVRS'
#config.oauth_token_secret = 'abY4hhz4tzYrvxbgaGkTaMVFxggU2HrTrQhE8PTNo'
#config.auth_method        = :oauth

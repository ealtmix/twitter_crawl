class Crawls < ActiveRecord::Base
  require 'tweetstream'
  require 'rubygems'

  def self.get_region_stats(word,region)
#    puts region.to_s
#    puts word.to_s

    Crawls.where("region = ? AND tweet LIKE ?",region.to_s, '%'+word.to_s+'%').all.to_s
    
  end

  def self.tweet_pruner
    while(true) do
      sleep 60
      Crawls.destroy_all(['updated_at > ?', 2.hours.ago])
    end
  end

  def self.chicago
    TweetStream.configure do |config|
	    config.consumer_key       = 'vodV1JZIlq0GjXz5I2Wg'
	    config.consumer_secret    = 'Z3wKtYy0kjiKhbPRF1PbDWylDFoOr6HarMR5XqxzWg'
	    config.oauth_token        = '1336836626-4VqaDyXbic4h1mf6R6KDmnSg6ioKEPbBed5StJQ'
	    config.oauth_token_secret = 'YxXHb7vC1MTXHw3A1hKCTThSmmDBdAISCYTuRukSaA'
	    config.auth_method        = :oauth
	  end
    client3 = TweetStream::Client.new
    client3.locations(-88.210602,41.553811,-87.400360,42.259016) do |status|
      puts "CHITOWN:"+status.text
      Crawls.create :region => "ChiTown", :tweet => status.text
	  end
  end

  def self.nyny
    TweetStream.configure do |config|
	    config.consumer_key       = 'vodV1JZIlq0GjXz5I2Wg'
	    config.consumer_secret    = 'Z3wKtYy0kjiKhbPRF1PbDWylDFoOr6HarMR5XqxzWg'
	    config.oauth_token        = '1336836626-4VqaDyXbic4h1mf6R6KDmnSg6ioKEPbBed5StJQ'
	    config.oauth_token_secret = 'YxXHb7vC1MTXHw3A1hKCTThSmmDBdAISCYTuRukSaA'
	    config.auth_method        = :oauth
	  end
    client1 = TweetStream::Client.new
    client1.locations(-88.210602,40.553811,-73.664703,41.957086) do |status|
      client1.on_error do |msg|
        puts msg.txt
      end
      puts "NYNY:"+status.text
      Crawls.create :region => "NewYork", :tweet => status.text
	  end
  end

  def self.atlanta
    TweetStream.configure do |config|
	    config.consumer_key       = 'vodV1JZIlq0GjXz5I2Wg'
	    config.consumer_secret    = 'Z3wKtYy0kjiKhbPRF1PbDWylDFoOr6HarMR5XqxzWg'
	    config.oauth_token        = '1336836626-4VqaDyXbic4h1mf6R6KDmnSg6ioKEPbBed5StJQ'
	    config.oauth_token_secret = 'YxXHb7vC1MTXHw3A1hKCTThSmmDBdAISCYTuRukSaA'
	    config.auth_method        = :oauth
	  end
    client4 = TweetStream::Client.new
    client4.locations(-84.541855,33.605470,-84.092789,34.018518) do |status|
      puts "ATLANTA:"+status.text
      Crawls.create :region => "Atlanta", :tweet => status.text
	  end
  end
  def self.colorado
    TweetStream.configure do |config|
	    config.consumer_key       = 'vodV1JZIlq0GjXz5I2Wg'
	    config.consumer_secret    = 'Z3wKtYy0kjiKhbPRF1PbDWylDFoOr6HarMR5XqxzWg'
	    config.oauth_token        = '1336836626-4VqaDyXbic4h1mf6R6KDmnSg6ioKEPbBed5StJQ'
	    config.oauth_token_secret = 'YxXHb7vC1MTXHw3A1hKCTThSmmDBdAISCYTuRukSaA'
	    config.auth_method        = :oauth
	  end
    client5 = TweetStream::Client.new
    client5.locations(-107.385864,38.548165,-103.705444,40.497092) do |status|
      puts "DENVER:"+status.text
      Crawls.create :region => "Denver", :tweet => status.text
	  end
  end

  def self.seattle
    TweetStream.configure do |config|
	    config.consumer_key       = 'vodV1JZIlq0GjXz5I2Wg'
	    config.consumer_secret    = 'Z3wKtYy0kjiKhbPRF1PbDWylDFoOr6HarMR5XqxzWg'
	    config.oauth_token        = '1336836626-4VqaDyXbic4h1mf6R6KDmnSg6ioKEPbBed5StJQ'
	    config.oauth_token_secret = 'YxXHb7vC1MTXHw3A1hKCTThSmmDBdAISCYTuRukSaA'
	    config.auth_method        = :oauth
	  end
    client6 = TweetStream::Client.new
    client6.locations(-125.529785,47.129951,-120.563965,49.696062) do |status|
      puts "SEATTLE:"+status.text
      Crawls.create :region => "Sea_Van", :tweet => status.text
	  end
  end

  def self.sanfran
    TweetStream.configure do |config|
	    config.consumer_key       = 'vodV1JZIlq0GjXz5I2Wg'
	    config.consumer_secret    = 'Z3wKtYy0kjiKhbPRF1PbDWylDFoOr6HarMR5XqxzWg'
	    config.oauth_token        = '1336836626-4VqaDyXbic4h1mf6R6KDmnSg6ioKEPbBed5StJQ'
	    config.oauth_token_secret = 'YxXHb7vC1MTXHw3A1hKCTThSmmDBdAISCYTuRukSaA'
	    config.auth_method        = :oauth
	  end
    client2 = TweetStream::Client.new
    client2.locations(-123.042755,37.302460,-121.828766,38.195022) do |status|
      puts "SANFRAN:"+status.text
      Crawls.create :region => "SanFran", :tweet => status.text
	  end
  end

  def self.florida
    TweetStream.configure do |config|
	    config.consumer_key       = 'vodV1JZIlq0GjXz5I2Wg'
	    config.consumer_secret    = 'Z3wKtYy0kjiKhbPRF1PbDWylDFoOr6HarMR5XqxzWg'
	    config.oauth_token        = '1336836626-4VqaDyXbic4h1mf6R6KDmnSg6ioKEPbBed5StJQ'
	    config.oauth_token_secret = 'YxXHb7vC1MTXHw3A1hKCTThSmmDBdAISCYTuRukSaA'
	    config.auth_method        = :oauth
	  end
    client8 = TweetStream::Client.new
    client8.locations(-87.121582,24.447150,-79.167480,30.939924) do |status|
      puts "FLORIDA:"+status.text
      Crawls.create :region => "Florida", :tweet => status.text
	  end
  end

  def self.dallas
    TweetStream.configure do |config|
	    config.consumer_key       = '5OmFa8Q9WdwgQZvgDU6UQw'
	    config.consumer_secret    = 'UVhqq9IA9JzAZVQ16hfnFNwvtZv938CyocXD4p2WfA0'
	    config.oauth_token        = '226011159-IcjiDKMb9iTQRNEyclshX3kVicnKePgUS9aNrVRS'
	    config.oauth_token_secret = 'abY4hhz4tzYrvxbgaGkTaMVFxggU2HrTrQhE8PTNo'
	    config.auth_method        = :oauth
	  end
    client7 = TweetStream::Client.new
    client7.locations(-99.777832,28.883160,-94.240723,33.504759) do |status|
      client7.on_error do |msg|
        puts msg.text
      end
      puts "DALLAS:"+status.text
      Crawls.create :region => "Texas", :tweet => status.text
	  end
  end

end

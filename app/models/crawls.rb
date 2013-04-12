class Crawls < ActiveRecord::Base
  require 'tweetstream'
  @current_tweet_id = 231;
  @keyword = "happy"

  def self.change_key_word(word1)
    @keyword = word1
  end

	def self.tweet_farmer
	  TweetStream.configure do |config|
	    config.consumer_key       = 'vodV1JZIlq0GjXz5I2Wg'
	    config.consumer_secret    = 'Z3wKtYy0kjiKhbPRF1PbDWylDFoOr6HarMR5XqxzWg'
	    config.oauth_token        = '1336836626-4VqaDyXbic4h1mf6R6KDmnSg6ioKEPbBed5StJQ'
	    config.oauth_token_secret = 'YxXHb7vC1MTXHw3A1hKCTThSmmDBdAISCYTuRukSaA'
	    config.auth_method        = :oauth
	  end
	  client1 = TweetStream::Client.new
	  client2 = TweetStream::Client.new
	  client1.on_error do |message|
	    puts message
	  end
	  client2.on_error do |message|
	    puts message
	  end
	  puts 'aaaaa yea'
	  thread1 = Thread.new{
	  client1.track("happy") do |status|
	    if ! status.geo.nil? then
	      puts "+++++++++++++++++++++++++++++" 
	      puts status.text
        puts status.user.user_name
	      puts status.geo.lat
	      puts status.geo.long
        Crawls.create(:tweet => status.text, :user => status.user.user_name, :lat => status.geo.lat, :long => status.geo.long)
	      puts "+++++++++++++++++++++++++++++"
	    end
	  end
	  }
	  thread2 = Thread.new{
	  client2.track("sad") do |status|
	    if ! status.geo.nil? then
	      puts "============================="
	      puts status.text
	      puts status.user.user_name
        puts status.geo.lat
        puts status.geo.long
	      puts "============================="
        Crawls.create(:tweet => status.text, :user => status.user.user_name, :lat => status.geo.lat, :long => status.geo.long)
	    end
	  end
	  }
	  thread1.join
	  thread2.join
	end 

  def self.next_tweet
    tweet_var = Crawls.order("created_at DESC").first!
    
    tweet_string = tweet_var.tweet
    @cur_tweet_id = tweet_var.id
    Crawls.destroy(tweet_var)
    tweet_string
  end
  def self.next_tweet_t
#tweet = Crawls.order("created_at").first!
#   if(@cur_tweet_id != 0) then
      tweet = Crawls.find(231)
#   end
    tweet_string = tweet.tweet
    #Crawls.destroy(tweet)
    puts tweet_string 
  end
end

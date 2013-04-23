require 'tweetstream'
require 'rubygems'

    TweetStream.configure do |config|
	    config.consumer_key       = 'vodV1JZIlq0GjXz5I2Wg'
	    config.consumer_secret    = 'Z3wKtYy0kjiKhbPRF1PbDWylDFoOr6HarMR5XqxzWg'
	    config.oauth_token        = '1336836626-4VqaDyXbic4h1mf6R6KDmnSg6ioKEPbBed5StJQ'
	    config.oauth_token_secret = 'YxXHb7vC1MTXHw3A1hKCTThSmmDBdAISCYTuRukSaA'
	    config.auth_method        = :oauth
	  end
    #New York, New York
	  TweetStream::Daemon.new.locations(-88.210602,40.552811,-73.664703,41.957086) do |status|
      Crawls.create :region => "NewYork", :tweet => status.text
      puts status.text
    end

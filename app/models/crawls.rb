class Crawls < ActiveRecord::Base
  require 'tweetstream'
  @current_tweet_id = 209#Crawls.order("id").first.id
  @keyword = "happy"

  def self.change_key_word(word1)
    @keyword = word1
  end

  def self.tweet_pruner

    old_tweet = Crawls.select 

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
	  client3 = TweetStream::Client.new
	  client4 = TweetStream::Client.new
	  client5 = TweetStream::Client.new
	  client6 = TweetStream::Client.new
	  client7 = TweetStream::Client.new
	  client8 = TweetStream::Client.new
	  client1.on_error do |message|
	    puts message
	  end
	  client2.on_error do |message|
	    puts message
	  end
    client3.on_error do |message|
	    puts message
	  end
    client4.on_error do |message|
	    puts message
	  end
    client5.on_error do |message|
	    puts message
	  end
    client6.on_error do |message|
	    puts message
	  end
    client7.on_error do |message|
	    puts message
	  end
    client8.on_error do |message|
	    puts message
	  end
	  thread1 = Thread.new{ #New York, New York
	  client1.locations(41.553811,-88.210602,40.957086,-73.664703) do |status|
      Crawls.create :NewYork, :tweet => status.text
	  end
	  }
	  thread2 = Thread.new{ #San Francisco, California
	  client2.locations(37.302460,-123.042755,38.195022,-121.828766) do |status|
      Crawls.create :SanFran, :tweet => status.text
	  end
	  }
    thread3 = Thread.new{ #Chicago, Illinois
	  client3.locations(41.553811,-88.210602,42.259016,87.400360) do |status|
      Crawls.create :ChiTown, :tweet => status.text
	  end
	  }
    thread4 = Thread.new{ # Atlanta, Georgia
	  client4.locations(33.605470,-84.541855,34.018518,-84.092789) do |status|
      Crawls.create :Atlanta, :tweet => status.text
	  end
	  }
    thread5 = Thread.new{ # Denver, Colorado
	  client5.locations(38.548165,-107.385864,40.497092,103.705444) do |status|
      Crawls.create :Denver, :tweet => status.text
	  end
	  }
    thread6 = Thread.new{ # Seattle, WA and Vancouver, BC, CA
	  client6.locations(47.129951,-125.529785,49.696062,-120.563965) do |status|
      Crawls.create :Sea_Van, :tweet => status.text
	  end
	  }
    thread7 = Thread.new{ # Dallas, Austin and Houston, Texas
	  client7.locations(28.883160,-99.777832,33.504759,-94.240723) do |status|
      Crawls.create :Texas, :tweet => status.text
	  end
	  }
    thread8 = Thread.new{ # Florida... as a whole
	  client8.locations(24.447150,-87.121582,30.939924,-79.167480) do |status|
      Crawls.create :Florida, :tweet => status.text
	  end
	  }
	  thread1.join#NYNY
	  thread2.join#SanFran
    thread3.join#ChiTown
    thread4.join#Atlanta
    thread5.join#Denver
    thread6.join#Seattle/Vancouver
    thread7.join#Dallas/Austin/Houston
    thread8.join#Florida
	end 

  def self.next_tweet
    tweet_var = Crawls.order("id").first
    tweet_string = tweet_var.tweet
    @cur_tweet_id = tweet_var.id+1
    Crawls.destroy(tweet_var)
    tweet_string
  end
end

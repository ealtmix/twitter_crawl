class Crawls < ActiveRecord::Base
  require 'tweetstream'
  @current_tweet_id = 209#Crawls.order("id").first.id
  @keyword = "happy"

  def self.change_key_word(word1)
    @keyword = word1
  end

  def self.tweet_pruner

#old_tweet = Crawls.select 

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
	  client1.locations(-88.210602,40.553811,-73.664703,41.957086) do |status|
      puts "NYNY:"+status.text
      Crawls.create :region => "NewYork", :tweet => status.text
	  end
 	  }
 	  thread2 = Thread.new{ #San Francisco, California
	  client2.locations(-123.042755,37.302460,-121.828766,38.195022) do |status|
      puts "SANFRAN:"+status.text
      Crawls.create :region => "SanFran", :tweet => status.text
	  end
 	  }
    thread3 = Thread.new{ #Chicago, Illinois
	  client3.locations(-88.210602,41.553811,-87.400360,42.259016) do |status|
      puts "CHITOWN:"+status.text
      Crawls.create :region => "ChiTown", :tweet => status.text
	  end
 	  }
    thread4 = Thread.new{ # Atlanta, Georgia
	  client4.locations(-84.541855,33.605470,-84.092789,34.018518) do |status|
      puts "ATLANTA:"+status.text
      Crawls.create :region => "Atlanta", :tweet => status.text
	  end
 	  }
    thread5 = Thread.new{ # Denver, Colorado
	  client5.locations(-107.385864,38.548165,-103.705444,40.497092) do |status|
      puts "DENVER:"+status.text
      Crawls.create :region => "Denver", :tweet => status.text
	  end
 	  }
    thread6 = Thread.new{ # Seattle, WA and Vancouver, BC, CA
	  client6.locations(-125.529785,47.129951,-120.563965,49.696062) do |status|
      puts "SEATTLE:"+status.text
      Crawls.create :region => "Sea_Van", :tweet => status.text
	  end
 	  }
    thread7 = Thread.new{ # Dallas, Austin and Houston, Texas
	  client7.locations(-99.777832,28.883160,-94.240723,33.504759) do |status|
      puts "DALLAS:"+status.text
      Crawls.create :region => "Texas", :tweet => status.text
	  end
 	  }
    thread8 = Thread.new{ # Florida... as a whole
	  client8.locations(-87.121582,24.447150,-79.167480,30.939924) do |status|
      puts "FLORIDA:"+status.text
      Crawls.create :region => "Florida", :tweet => status.text
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

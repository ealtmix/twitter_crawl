class Crawls < ActiveRecord::Base
require 'tweetstream'
  @keyword = "happy"
  def self.change_key_word(word1)
    @keyword = word1
  end
	def self.next_tweet
  puts "shit"
  TweetStream.configure do |config|
    config.consumer_key       = 'vodV1JZIlq0GjXz5I2Wg'
    config.consumer_secret    = 'Z3wKtYy0kjiKhbPRF1PbDWylDFoOr6HarMR5XqxzWg'
    config.oauth_token        = '1336836626-4VqaDyXbic4h1mf6R6KDmnSg6ioKEPbBed5StJQ'
    config.oauth_token_secret = 'YxXHb7vC1MTXHw3A1hKCTThSmmDBdAISCYTuRukSaA'
    config.auth_method        = :oauth
  end
  @keyword = "donkey"
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
  client1.track("crap") do |status|
    if ! status.geo.nil? then
      puts "+++++++++++++++++++++++++++++" 
      puts status.text
      puts status.geo.lat
      puts status.geo.long
      puts "+++++++++++++++++++++++++++++"
    end
#  Crawls.create(:tweet => status.text)
  end
  }
  thread2 = Thread.new{
  client2.filter({:locations => [-74.277191,40.498624,-73.505402,41.045664]}) do |status|
    if status.text.include?("and") then
    puts "============================="
      puts status.text
      puts status.user.user_name
      puts "============================="
    end
#  Crawls.create(:tweet => status.text)
  end
  }
  thread1.join
  thread2.join
	#     thread1 = Thread.new{
	#       client.locations(74.277191,40.498624,73.505402,41.045664) do |status|
	#           puts "=================="
	#           puts "#{status.text}"
	#           puts "#{status.user.location}"
	#           puts "=================="
	#         end
	#         }
	#         thread2 = Thread.new{
	#           client.locations(74.277191,40.498624,73.505402,41.045664) do |status|
	#               puts "++++++++++++++++++"
	#               puts "#{status.text}"
	#               puts "#{status.user.location}"
	#               puts "++++++++++++++++++"
	#             end
	#             }
	#             thread1.join
	#             thread2.join
	end 
end

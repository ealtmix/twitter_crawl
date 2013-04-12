require 'rubygems'
require 'twitter'
require 'tweetstream'
require 'yajl'
require 'oauth'
require ENV["RAILS_ENV_PATH"]
TweetStream.configure do |config|
	config.consumer_key       = 'vodV1JZIlq0GjXz5I2Wg'
	config.consumer_secret    = 'Z3wKtYy0kjiKhbPRF1PbDWylDFoOr6HarMR5XqxzWg'
	config.oauth_token        = '1336836626-4VqaDyXbic4h1mf6R6KDmnSg6ioKEPbBed5StJQ'
	config.oauth_token_secret = 'YxXHb7vC1MTXHw3A1hKCTThSmmDBdAISCYTuRukSaA'
	config.auth_method        = :oauth
end
@keyword = "donkey"
client = TweetStream::Client.new

puts client.to_s
client.on_error do |message|
  puts message
end
puts 'aaaaa yea'
client.filter({:locations => [-74.277191,40.498624,-73.505402,41.045664], :track => "donkey"}) do |status|
  puts status.text
  puts 'again'
#  Crawls.create(:tweet => status.text)
end
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

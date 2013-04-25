require 'spec_helper'
require 'tweetstream'

describe CrawlsController do
  fake_tweet = Crawls.create(:tweet => 'tweet', :lat => 10, :long => 10, :user => 'test')
  describe 'Viewing Tweets:' do
    it 'should call the next_tweet method' do
      Crawls.should_receive(:next_tweet)
			#Crawls.
      get :index
    end
  end


end



require 'spec_helper'
require 'tweetstream'

describe CrawlsController do
  fake_tweet = Crawls.create(:tweet => 'tweet', :lat => 10, :long => 10, :user => 'test')
  describe 'Viewing Tweets:' do
    it 'should call the next_tweet method' do
      Crawls.should_receive(:next_tweet)
      get :index
    end
  end

  describe 'Partial Tweets:' do
    it 'should respond to partial tweets' do
      get :_tweet_partial
    end
  end

end



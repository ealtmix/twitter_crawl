require 'spec_helper'
require 'tweetstream'

describe CrawlsController do
  describe 'Viewing Tweets:' do
    it 'should call the get_region_stats method' do
      Crawls.should_receive(:get_region_stats)
      get :index
    end
  end
<<<<<<< HEAD

  describe 'Partial Tweets:' do
    it 'should respond to partial tweets' do
      get :_tweet_partial
    end
  end

=======
>>>>>>> bd6aa42920f11716283af9f5993e00c19ab6678c
end



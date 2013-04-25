require 'spec_helper'
require 'tweetstream'

describe CrawlsController do
  describe 'Viewing Tweets:' do
    it 'should call the get_region_stats method' do
      Crawls.should_receive(:get_region_stats)
      get :index
    end
  end
end



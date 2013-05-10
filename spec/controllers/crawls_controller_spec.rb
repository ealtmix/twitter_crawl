require 'spec_helper'
require 'tweetstream'

describe CrawlsController do
  describe 'Viewing the main map:' do
    it 'should call the get_region_stats method' do
      Crawls.should_receive(:get_region_stats).at_least(1).times
      get :index
    end
    it 'should call the cities method' do
      Crawls.should_receive(:cities)
      get :index
    end
  end
end



require 'spec_helper'

describe Crawls do
  it 'should return a hash of tweets from the get_region_stats method' do
    Crawls.create(:tweet => 'tweet', :region => 'NewYork')
    Crawls.get_region_stats('tweet','NewYork').is_a?(Hash)
  end
end

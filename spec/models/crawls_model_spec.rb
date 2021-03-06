require 'spec_helper'

describe Crawls do
  it 'should return information string from the get_region_stats method' do
    Crawls.create(:region => 'NewYork', :tweet => 'tweet')
    Crawls.get_region_stats('tweet','NewYork').is_a?(String)
  end
  it 'should return a hash from the cities method' do
    Crawls.cities.is_a?(Hash)
  end
  it 'should return a fixed num from the get_region_count method' do
    Crawls.get_region_count('Chicago').is_a?(Fixnum)
  end
  it 'should return nil from the farm method' do
    Crawls.farm("Chicago, IL", true).nil?
    Crawls.farm("New York, NY", true).nil?
  end
  it 'should return nil from the tweet_pruner method' do
    Crawls.tweet_pruner(true).nil?
  end
end

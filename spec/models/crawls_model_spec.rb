require 'spec_helper'

describe Crawls do
  #describe 'Change keyword:' do
    it 'should call the change_key_word method' do
      Crawls.should_receive(:tweet_pruner)
      
    end
  #end
end
describe Crawls do
  it 'should return a hash of tweets from the get_region_stats method' do
    Crawls.create(:region => 'NewYork', :tweet => 'tweet')
    Crawls.get_region_stats('tweet','NewYork').is_a?(Hash)
  end
end

require 'spec_helper'

<<<<<<< HEAD
describe CrawlsModel do
  describe 'Change keyword:' do
    it 'should call the change_key_word method' do
      Crawls.should_receive(:tweet_pruner)
      
    end
=======
describe Crawls do
  it 'should return a hash of tweets from the get_region_stats method' do
    Crawls.create(:tweet => 'tweet', :region => 'NewYork')
    Crawls.get_region_stats('tweet','NewYork').is_a?(Hash)
>>>>>>> 3533a037e81b3bb34639a8cd61fa974fdfcf65c7
  end
end

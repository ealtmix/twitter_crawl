require 'spec_helper'

describe CrawlsModel do
  describe 'Change keyword:' do
    it 'should call the change_key_word method' do
      Crawls.should_receive(:tweet_pruner)
      
    end
  end
end

require 'spec_helper'

describe CrawlsModel do
  describe 'Change keyword:' do
    it 'should call the change_key_word method' do
      #Crawls.should_receive(:change_key_word.with('happy'))
      asdf = Factory(:Crawls, a1: "happy")
      Crawls.change_key_word.should == "happy"
    end
  end
end

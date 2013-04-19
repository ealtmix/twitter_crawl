require 'spec_helper'
#                                                                
describe CrawlsController do
  fake_tweet = Crawls.create(:tweet => 'tweet', :lat => 10, :long => 10, :user => 'test')
  describe 'Viewing Tweets:' do
    it 'should call the next_tweet method' do
      Crawls.should_receive(:next_tweet)
      get :index
    end
#        @tweet = mock(Crawls)
#        @tweet.stub!(:tweet_farmer).and_return("happy")
#                                                                
#                                                                
#        Crawls.should_receive(:tweet_farmer).and_return("happy")
#        answer = @tweet.tweet_farmer
#        answer.should match("happy")
#                                                                
#        before(:each) do
#            @tweet = mock(Crawls)
#            @tweet.stub!(:tweet_farmer).and_return("happy")
#        end
#        it 'Should find tweets containing the keyword being searched for' do
#            get :index
#            @tweet.should_receive(:tweet_farmer).and_return("happy")
#            answer = @tweet.tweet_farmer
#            answer.should match("happy")
#        end
  end
end



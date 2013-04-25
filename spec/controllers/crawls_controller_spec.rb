require 'spec_helper'
require 'tweetstream'

describe CrawlsController do
  describe 'Viewing Tweets:' do
    it 'should call the get_region_stats method' do
      Crawls.should_receive(:get_region_stats)
      get :index
    end
  end
=begin
  describe 'Partial Tweets:' do
    it 'should respond to partial tweets' do
      get :_tweet_partial
    end
  end

  describe 'Changing keyword:' do
    it 'should change the keyword' do
      mock = mock('Crawls')
      mock.should_receive(:change_key_word, :word1 =>'happy')
      get :index
      
      #mock.stub(:change_key_word)
      #mock.should_receive(:change_key_word).with(:word1 => 'sad')
      #Crawls.should_receive(:change_key_word).with(:keyword => 'happy')
    end
  end
=end

  describe 'Farming tweets:' do
    it 'should farm certain tweets for Twitter' do
      mock = mock('Crawls')
      get :edit
      #mock.should_receive(:tweet_farmer)
      #mock.stub!(:tweet_farmer).and_return(:tweet => 'happy', :user => 'SELT', :lat => 10, :long => 10)
    end
  end

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



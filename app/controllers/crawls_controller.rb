class CrawlsController < ApplicationController
  @last_tweet = Array.new
  def show
 
  end
  
  def index
    @tweet = Crawls.next_tweet
    respond_to do |format|
     format.html
    end
#@last_tweet.push @tweet
  end

  def tweet_update
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end

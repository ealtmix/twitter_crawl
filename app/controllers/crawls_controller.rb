class CrawlsController < ApplicationController
  def show
    @tweet = Crawls.get_region_stats("a","Chicago").tweet
    @word1 = params["word1"]
    @word2 = params["word2"]
    # the following are the two colors associated with the two words above
    @color1 = params["color1"]
    @color2 = params["color2"]
    respond_to do |format|
      format.html {redirect_to crawls_path}
      format.js {render :layout => false}
    end
  end

  def cities
    @cities = Crawls.cities
  end

  def index
    @cities = Crawls.cities
    # getting user input from form submission, which will be used to customize results for the user
    # the following are the two words that the user wants to track
    @word1 = params["word1"]
    @word2 = params["word2"]
    # the following are the two colors associated with the two words above
    @color1 = params["color1"]
    @color2 = params["color2"]
    @word1_tweets = Crawls.get_region_stats(@word1.to_s,"Chicago").count
    @word2_tweets = Crawls.get_region_stats(@word2.to_s,"Chicago").count
    respond_to do |format|
      format.html {render}
      format.js { render :layout => false }
    end
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

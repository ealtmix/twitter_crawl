class CrawlsController < ApplicationController
  @last_tweet = Array.new
  def show
 
  end

  def cities
    Crawls.cities
  end
  
  def index
    @tweets = Crawls.get_region_stats("tweet","NewYork")
    # getting user input from form submission, which will be used to customize results for the user
    # the following are the two words that the user wants to track
    @word1 = params["word1"]
    @word2 = params["word2"]
    # the following are the two colors associated with the two words above
    @color1 = params["color1"]
    @color2 = params["color2"]
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

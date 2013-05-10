class CrawlsController < ApplicationController
  def show
  end

  def index
    @cities = Crawls.cities
    # getting user input from form submission, which will be used to customize results for the user
    # the following are the two words that the user wants to track
    @word1 = params["word1"]
    @word2 = params["word2"]
    if(@word1.nil?) then @word1='and' end
    if(@word2.nil?) then @word2='and' end
    # the following are the two colors associated with the two words above
    @color1 = params["color1"]
    @color2 = params["color2"]
    @chicago_1 = Crawls.get_region_stats(@word1.to_s,"Chicago")
    @chicago_2 = Crawls.get_region_stats(@word2.to_s,"Chicago")
    @newyork_1 = Crawls.get_region_stats(@word1.to_s,"New York")
    @newyork_2 = Crawls.get_region_stats(@word2.to_s,"New York")
    @chi_count = Crawls.get_region_count("Chicago")
    @ny_count = Crawls.get_region_count("New York")
    if(!@chicago_1.nil? && !@chicago_2.nil? && !@newyork_1.nil? && !@newyork_2.nil?) then
      @word1_num_chi = @chicago_1.count
      @word2_num_chi = @chicago_2.count
      @word1_num_ny = @newyork_1.count
      @word2_num_ny = @newyork_2.count
      @word1_tweets_chi = @word1 + ": "+@chicago_1.count.to_s+" "
      @word2_tweets_chi = @word2 + ": "+@chicago_2.count.to_s+" "
      @word1_tweets_ny = @word1 + ": "+@newyork_1.count.to_s+" "
      @word2_tweets_ny = @word2 + ": "+@newyork_2.count.to_s+" "
    end
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

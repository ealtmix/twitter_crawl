class CrawlsController < ApplicationController
  @last_tweet = Array.new
  def show
 
  end
  
  def index
    @tweets = Crawls.get_region_stats("tweet","NewYork")
    # getting user input from form submission, which will be used to customize results for the user
    @word_to_track = params['word_to_track'] #display only tweets that contain this word, i.e. tracking this word
    @remove_or_not = params['remove_tracking'] #if this value is 'yes', then display tweets NOT containing the word
    # the following are colors to display for the pins on the map
    @happy_pin_color = params['happy']
    @sad_pin_color = params['sad']
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

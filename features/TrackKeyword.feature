Feature: Track a keyword

  As a site visitor
  So that I can track the use of two keywords for a given area
  I want to be able to add two keywords to be tracked for the area I am looking at


Background: Tweets on page

  Given the following tweets are displayed on TwitterCrawler:
  |tweet        |user   |lat  	|long	|
  |I am happy   |George |7.34	|19.25 	|
  |We are happy |Lucas  |56.34 	|20.06 	|
  |happy        |Ridley |12.34  |51.69 	|
  |OMG happy    |Scott	|78.34 	|65.25 	|


Scenario: Track two keywords trending on Twitter

  Given I am on the TwitterCrawler home page
  When I search for "happy" and "sad" 
  Then all tweets shown should contain "happy" or "sad"

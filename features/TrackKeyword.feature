Feature: Track a keyword

  As a site visitor
  So that I can track the use of two keywords for a given area
  I want to be able to add two keywords to be tracked for the area I am looking at


Background: Tweets on page

  Given the following tweets are displayed on TwitterCrawler:
  |tweet        |region 	|
  |I am happy   |New York |
  |We are happy |Chicago  |
  |happy        |New York |
  |OMG happy    |Chicago	|


Scenario: Track two keywords trending on Twitter

  Given I am on the TwitterCrawler home page
  When I search for "happy" and "sad" 
  Then the header shown shown should contain "happy" or "sad"

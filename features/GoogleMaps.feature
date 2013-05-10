Feature: Display a map with tweets

	As a site visitor
  So that I can see a visual display with tweets on a map
  I want to be able to see tweets on a map for given areas


Background: Tweets on page

  Given the following tweets are displayed on TwitterCrawler:
  |tweet        |region 	|
  |I am happy   |New York |
  |We are happy |Chicago  |
  |happy        |New York |
  |OMG happy    |Chicago	|

Scenario: Google map appears on webpage

  Given I am on the TwitterCrawler home page
  Then I should see a map




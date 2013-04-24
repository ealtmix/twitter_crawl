Feature: Display a map with tweets

	As a site visitor
  So that I can see a visual display with tweets on a map
  I want to be able to see tweets on a map for given areas


Background: Tweets on page

  Given the following tweets are displayed on TwitterCrawler:
  |tweet        |user   |lat  	|long	  |
  |I am happy   |George |7.34	  |19.25 	|
  |We are happy |Lucas  |56.34 	|20.06 	|
  |happy        |Ridley |12.34  |51.69 	|
  |OMG happy    |Scott	|78.34 	|65.25 	|

Scenario: Google map appears on webpage

  Given I am on the TwitterCrawler home page
  Then I should see a map




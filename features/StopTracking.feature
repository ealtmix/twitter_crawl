Feature: Stop tracking a keyword

  As a site visitor
  So that I can remove a keyword from the area I am viewing
  I want to be able to pick a keyword to stop tracking

Background: Tweets on page

  Given the following tweets are displayed on TwitterCrawler:
  |tweet        |user   |lat  	|long	|
  |I am happy   |George |7.34	|19.25 	|
  |We are happy |Lucas  |56.34 	|20.06 	|
  |Happy        |Ridley |12.34  |51.69 	|
  |OMG happy    |Scott	|78.34 	|65.25 	|


Scenario: Stop tracking a keyword

 Given I am tracking "happy"
 And I am on the TwitterCrawler home page
 When I remove "happy" from the keywords
 Then I should see not see "happy" displayed
 But I should see "sad" displayed

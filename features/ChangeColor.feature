Feature: Change colors of pins

As a site visitor
So that I can see which areas have more happy tweets than sad tweets
I want to be able to choose colors for pins on the map according to happy, sad, and neutral

Background: Tweets on page

  Given the following tweets are displayed on TwitterCrawler:
  |tweet        |user   |lat  	|long	|
  |I am sad     |George |7.34	|19.25 	|
  |We are happy |Lucas  |56.34 	|20.06 	|
  |Happy        |Ridley |12.34  |51.69 	|
  |OMG happy    |Scott	|78.34 	|65.25 	|
  |OMG sad      |Mike   |78.34  |65.25  |

Scenario: Change pin color

 Given I am on the TwitterCrawler home page
 When I choose green for happy pins
 And I choose gray for sad pins
 And I choose yellow for neutral pins
 Then I should see the pin at location 56.34,20.06 is green
 And I should see the pin at location 7.34,19.25 is gray
 And I should see the pin at location 78.34,65.25 is yellow
 

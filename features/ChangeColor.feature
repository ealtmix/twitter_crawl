Feature: Change colors of pins

As a site visitor
So that I can see which areas have more tweets containing one keyword than the other keyword
I want to be able to choose colors for pins on the map according to the two keywords

Background: Tweets on page

  Given the following tweets are displayed on TwitterCrawler:
  |tweet        |region  	|
  |I am sad     |New York |
  |We are happy |Chicago	|
  |Happy        |New York |
  |OMG happy    |Chicago 	|
  |OMG sad      |New York |
  |sad          |Chicago  |
  |sad          |New York |
  |happy        |Chicago  |

Scenario: Change pin color

 Given I am on the TwitterCrawler home page
 And I search for "happy" and "sad" 
 When I choose "Red" for the color of the first keyword
 And I choose "Blue" for the color of the second keyword
 Then I should see the pin at "New York" is "Blue"
 And I should see the pin at "Chicago" is "Red"
 

Feature: Change colors of pins

As a site visitor
So that I can see which areas have more tweets containing one keyword than the other keyword
I want to be able to choose colors for pins on the map according to the two keywords

Background: Tweets on page

  Given the following tweets are displayed on TwitterCrawler:
  |tweet        |user   |lat	|long	|
  |I am sad     |George |34 	|-84.20 |
  |We are happy |Lucas  |33.80 	|-84.30	|
  |Happy        |Ridley |33.90  |-84.50 |
  |OMG happy    |Scott	|39 	|-104 	|
  |OMG sad      |Mike   |38.60  |-105   |
  |sad          |Jack   |38.70  |-106   |
  |sad          |Tom    |48     |-121   |
  |happy        |Jason  |49     |-122   |

Scenario: Change pin color

 Given I am on the TwitterCrawler home page
 And I search for "happy" and "sad" 
 When I choose "green" for the color of the first keyword
 And I choose "gray" for the color of the second keyword
 Then I should see the pin at "Atlanta" is "green"
 And I should see the pin at "Denver" is "gray"
 

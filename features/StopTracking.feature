Feature: Stop tracking a keyword

  As a site visitor
  So that I can remove a keyword from the area I am viewing
  I want to be able to pick a keyword to stop tracking

Scenario: Stop tracking a keyword

 Given I am tracking "#happy" and "#sad"
 And I am on the TwitterCrawler home page
 When I remove "#happy" from the keywords
 Then I should see not see "#happy" displayed
 But I should see "#sad" displayed

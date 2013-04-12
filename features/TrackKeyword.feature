Feature: Track a keyword

  As a site visitor
  So that I can track a keyword's use for a given area
  I want to be able to add a keyword to be tracked for the area I am looking at

Scenario: Track two keywords trending on Twitter

 Given I am on the TwitterCrawler home page
 When I search for "#happy" and "#sad"
 Then all tweets shown should contain either "#happy" or "#sad"
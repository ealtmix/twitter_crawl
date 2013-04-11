Feature: Track a keyword

  As a site visitor
  So that I can track a keyword's use for a given area
  I want to be able to add a keyword to be tracked for the area I am looking at

Scenario: Track a keyword trending on Twitter (Declarative)

 When I search for "#happy"
 And I am on the TwitterCrawler home page
 Then I should see all tweets with "#happy" in a given area

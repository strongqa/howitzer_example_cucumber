Feature: Article Comments List
  As user
  I want to view my article comments 
  So I can view my article comments on article comments list on article page

  Background:
    Given there is registered user
    And there is article
    And there is comment1 for article
    And there is comment2 for article
    And I am logged in as user

  Scenario: user can see article comments on Article comments list on article page
    When I go to the article page
    Then I should see comments on article page
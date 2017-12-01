@smoke
Feature: Article list
  As user
  I want to view my articles
  So I can view my articles in article list

  Scenario: user can see articles in Article list
    Given there is article1
    And there is article2
    And there is registered user
    And I am logged in as user
    When I open article list page
    Then I should see articles parameters on article list page

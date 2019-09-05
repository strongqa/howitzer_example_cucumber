Feature: Filtering
  As user
  I want to filter my articles
  So I can filter my articles by category in article list

  Background:
    Given there is article1 with special category
    And there is article2 with special category
    And there is registered user
    And I am logged in as user

  Scenario: user can filter article by category
    When I open article list page
    Then I should see category of created articles in right sidebar on article list page
    When I click on category in right sidebar on article list page
    Then I should be redirected to categories page
    And I should see two articles on categories page
    And I log out on categories page
    And I am logged in as admin user
    And I am navigating on categories list page
    And I click delete button near nedded category on categories list page

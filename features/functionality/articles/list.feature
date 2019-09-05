@smoke
Feature: Article list
  As user
  I want to view my articles
  So I can view my articles in article list

  Background:
    Given there is article1
    And there is article2
    And there is registered user
    And I am logged in as user

  Scenario: user can see articles in Article list
    When I open article list page
    Then I should see articles parameters on article list page

  Scenario: user can find necessary articles by name in Article list
    When I open article list page
    And I search necessary article in right sidebar on article list page
    Then I should be redirected to search page
    And I should see article on search page

  @wip
  Scenario: user can see and open recently created articles in right sidebar of Article list
    When I open article list page
    Then I should see created article in recent post on article list page
    When I click on article in recent post on article list page
    Then I should be redirected to article page
    And I should see article parameters on article page

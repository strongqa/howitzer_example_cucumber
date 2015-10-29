@ok
Feature: Home

  Background:
    Given I am logged in as admin user
    And there is article

  Scenario: visitor can see home page of web application
    When I open home page
    Then I should see today form on home page with article data
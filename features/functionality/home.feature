@smoke
Feature: Home

  Scenario: visitor can see home page of web application
    Given I am logged in as admin user
    And there is article
    When I open home page
    Then I should see today form on home page with article data

  Scenario: visitor can see howitzer banner
    When I open home page
    And I open quick start on howitzer frame
    Then I should see install section on howitzer frame

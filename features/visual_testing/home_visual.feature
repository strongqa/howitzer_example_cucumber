@visual
Feature: Home page visual appearance
  Scenario: Home page looks has no differences with baseline
    Given eyes are opened
    And home page of web application
    When I look at the page
    Then page should not differ from the baseline

  Scenario: Home page visual
    When I open home page
    Then I make screenshot to upload it for comparison
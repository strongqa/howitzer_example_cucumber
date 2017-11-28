Feature: Howitzer - Capybara screenshot integration

  Scenario: Test suite can create page screenshot
    When I navigate to home page
    And I force making screenshot
    Then screenshot should be created and placed in log directory
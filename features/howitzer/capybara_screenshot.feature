Feature: Howitzer - Capybara screenshot integration

  Scenario: Capybara screenshot library stores screenshot and source page in proper location
    When I navigate to home page
    And I force making screenshot and saving source page
    Then I should see screenshot in log directory
    And I should see source page in log directory
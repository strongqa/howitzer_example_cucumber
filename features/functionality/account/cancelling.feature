
Feature: Account Cancelling
  As a user 
  I do not want to login the system
  So I can cancel my account

  Scenario: user can cancel his account
    Given there is registered user
    And I am on login page
    When I fill form on login page
    And I submit form on login page
    Then I should be logged in the system
    And I should be redirected to home page
    When I open edit account page
    And I cancel account on edit account page
    Then I should see following text on home page:
      """
      Bye! Your account was successfully cancelled. We hope to see you again soon.
      """
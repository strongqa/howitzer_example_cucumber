Feature: Non-Admin User Viewing
  As a user
  I should not be able to view other users
  So I can't see data of other user

  Scenario: user can't viewing other users on user page
    Given there is registered user1
    And I am logged in as user1
    And I am trying to navigate on users page
    Then I should be redirected to home page

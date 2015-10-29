Feature: User Viewing
  As a user
  I want to view other user
  So I can see data of other user

  Background:
    Given there is registered user1
    And there is registered user2
    And I am logged in as user1
    And users page of web application

  Scenario: user is viewing other user on user page
    When I click on user2 email on users page
    Then I should see user2 email text on user view page
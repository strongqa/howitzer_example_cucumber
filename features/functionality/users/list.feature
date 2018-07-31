Feature: Users List
  As a admin user
  I want to see users registered in system
  So I can see Users list

  Scenario: user is viewing users in Users list
    Given I am logged in as admin user
    When I navigate to users list via main menu
    Then I should see user email signed up on today's date

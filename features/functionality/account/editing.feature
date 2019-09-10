Feature: Account Editing
  As a user
  I want to edit my account
  So I can change my name, password and email

  Scenario: user can edit password and name with correct credentials
    Given there is registered user
    And I am logged in as user
    And I am on edit account page
    When I fill form on edit account page with new password and name
    And I submit form on edit account page
    Then I should see following text on home page:
    """
    You updated your account successfully.
    """
    When I log out on home page
    Then I should not be logged in the system
    When I open login page
    And I fill form on login page with new password
    And I submit form on login page
    Then I should be logged in the system
    When I open edit account page
    Then I should see form data on edit account page

  @p1
  Scenario: user can edit email with correct credentials
    Given there is registered user
    And I am logged in as user
    And I am on edit account page
    When I fill form on edit account page with new email
    And I submit form on edit account page
    Then I should see following text on home page:
      """
      You updated your account successfully, but we need to verify your new email address. Please check your email and click on the confirm link to finalize confirming your new email address.
      """
    When I confirm account from confirmation instruction email
    Then I should see following text on home page:
      """
      Your account was successfully confirmed.
      """
    When I log out on home page
    Then I should not be logged in the system
    When I open login page
    And I fill form on login page with new email
    And I submit form on login page
    Then I should be logged in the system
    And I should see following text on home page:
      """
      Signed in successfully.
      """

  @p1
  Scenario: user can not edit account with incorrect email
    Given there is registered user
    And I am logged in as user
    And I am on edit account page
    When I fill form on edit account page with incorrect email
    And I submit form on edit account page
    Then edit account page should be displayed

  @p1
  Scenario: user can not edit account with existing email
    Given there is registered user1
    And there is registered user2
    And I am logged in as user1
    And I am on edit account page
    When I fill form on edit account page with existing email
    And I submit form on edit account page
    Then I should see following text on edit account page:
      """
      1 error prohibited this user from being saved: Email has already been taken
      """

  @p1
  Scenario: user can not edit account with incorrect password
    Given there is registered user
    And I am logged in as user
    And I am on edit account page
    When I fill form on edit account page with incorrect current password
    And I submit form on edit account page
    Then I should see following text on edit account page:
      """
      1 error prohibited this user from being saved: Current password is invalid
      """

  @p1
  Scenario: user can not edit account with incorrect password confirmation
    Given there is registered user
    And I am logged in as user
    And I am on edit account page
    When I fill form on edit account page with incorrect password confirmation
    And I submit form on edit account page
    Then I should see following text on edit account page:
      """
      1 error prohibited this user from being saved: Password confirmation doesn't match Password
      """

  @p1
  Scenario: user can not edit account with short password (less then 8 characters)
    Given there is registered user
    And I am logged in as user
    And I am on edit account page
    When I fill form on edit account page with short password
    And I submit form on edit account page
    Then I should see following text on edit account page:
      """
      1 error prohibited this user from being saved: Password is too short (minimum is 8 characters)
      """

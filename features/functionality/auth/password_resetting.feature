Feature: Password Resetting
  As a user
  I want to reset my password
  So I can login the system with new password

  Scenario: user can reset password with correct data
    Given there is registered user
    And login page of web application
    When I click Forgot password? link on login page
    And I fill form on forgot password page
    And I submit form on forgot password page
    Then I should see following text on login page:
      """
      You will receive an email with instructions on how to reset your password in a few minutes.
      """
    And I should receive reset password confirmation email
    When I confirm resetting password from reset password confirmation email
    And I fill form on change password page
    And I submit form on change password page
    Then I should see following text on home page:
      """
      Your password was changed successfully. You are now signed in.
      """
    And I should be logged in the system

  @p1
  Scenario: user can not reset password with incorrect new password
    Given there is registered user
    And login page of web application
    When I click Forgot password? link on login page
    And I fill form on forgot password page
    And I submit form on forgot password page
    Then I should see following text on login page:
      """
      You will receive an email with instructions on how to reset your password in a few minutes.
      """
    And I should receive reset password confirmation email
    When I confirm resetting password from reset password confirmation email
    And I fill form on change password page with different data
    And I submit form on change password page
    Then I should see following text on change password page:
      """
      1 error must be fixed Password confirmation doesn't match Password
      """
    And I fill form on change password page with short password
    And I submit form on change password page
    Then I should see following text on change password page:
      """
      1 error must be fixed Password is too short (minimum is 8 characters)
      """

  @p1
  Scenario: user can not reset password with incorrect email
    Given login page of web application
    When I click Forgot password? link on login page
    And I fill form on forgot password page with incorrect data
    And I submit form on forgot password page
    Then I should see following text on forgot password page:
      """
      1 error must be fixed Email not found
      """
    And I fill form on forgot password page with not email data
    And I submit form on forgot password page
    Then forgot password page should be displayed

  Scenario: user can login with old password until confirmation email for new password is not confirmed
    Given there is registered user
    And login page of web application
    When I click Forgot password? link on login page
    And I fill form on forgot password page
    And I submit form on forgot password page
    Then I should see following text on login page:
      """
      You will receive an email with instructions on how to reset your password in a few minutes.
      """
    When I fill form on login page
    And I submit form on login page
    Then I should be logged in the system
    And I should be redirected to home page

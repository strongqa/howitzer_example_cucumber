Feature: Log In
  As a user
  I want to use my credentials to login the system
  So I can login the system

  Scenario: user can open login page via menu
    Given home page of web application
    When I click login menu item on home page
    Then login page should be displayed

  Scenario: user can login with correct credentials
    Given there is registered user
    And login page of web application
    When I fill form on login page
    And I submit form on login page
    Then I should be logged in the system
    And I should be redirected to home page

  @bug
  Scenario: user can login with remembering credentials
    Given there is registered user
    And login page of web application
    When I fill form on login page with remembering credentials
    And I submit form on login page
    Then I should be logged in the system
    And I should be redirected to home page
    When I click logout menu item on home page
    And I click login menu item on home page
    And I should see user email on login page
    When I submit form on login page
    Then I should be logged in the system
    And I should be redirected to home page

  @p1
  Scenario: user can not login without credentials
    Given there is registered user
    And login page of web application
    When I fill form on login page with blank data
    And I submit form on login page
    And I should see following text on login page:
      """
      Invalid email or password.
      """
    And I am navigating on home page
    Then I should not be logged in the system

  @p1
  Scenario: user can not login with incorrect credentials
    Given there is registered user
    And login page of web application
    When I fill form on login page with incorrect email
    And I submit form on login page
    Then I should see following text on login page:
      """
      Invalid email or password.
      """
    And I am navigating on home page
    And I should not be logged in the system
    And I am navigating on login page
    When I fill form on login page with incorrect password
    And I submit form on login page
    Then I should see following text on login page:
      """
      Invalid email or password.
      """
    And I am navigating on home page
    And I should not be logged in the system

  Scenario: user can not login until confirmation email is not confirmed
    Given sign up page of web application
    When I fill form on sign up page with new data
    And I submit form on sign up page
    Then I should see following text on home page:
      """
      A message with a confirmation link has been sent to your email address. Please open the link to activate your account.
      """
    And I should be redirected to home page
    And I should not be logged in the system
    When I am navigating on home page
    And I should not be logged in the system
    And I open login page
    And I fill form on login page
    And I submit form on login page
    Then I should see following text on login page:
      """
      You have to confirm your account before continuing.
      """
    And I am navigating on home page
    And I should not be logged in the system

  Scenario: canceled user can not login
    Given there is registered user
    And I am on login page
    When I fill form on login page
    And I submit form on login page
    And I should be logged in the system
    And I should be redirected to home page
    And I open edit account page
    And I cancel account on edit account page
    Then I should see following text on home page:
    """
    Bye! Your account was successfully cancelled. We hope to see you again soon.
    """
    When I click login menu item on home page
    Then login page should be displayed
    When I fill form on login page
    And I submit form on login page
    Then I should see following text on login page:
    """
    Invalid email or password.
    """

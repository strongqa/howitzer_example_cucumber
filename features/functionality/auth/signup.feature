Feature: Sign Up
  As a user
  I want to sign up to the system
  So I can login with a new account

  @smoke
  Scenario: user can open sign up page via menu
    Given home page of web application
    When I click sign up menu item on home page
    Then I should be redirected to sign up page

  @smoke
  Scenario: visitor can initiate sign up
    Given login page of web application
    When I click sign up link on login page
    Then I should be redirected to sign up page

  Scenario: user can sign up with correct credentials
    Given sign up page of web application
    When I fill form on sign up page with new data
    And I submit sign up form on sign up page
    Then I should not be logged in the system
    And I should see following text on home page:
      """
      A message with a confirmation link has been sent to your email address. Please open the link to activate your account.
      """
    And I should receive confirmation instruction email
    When I confirm sing up from confirmation instruction email
    Then I should see following text on login page:
      """
      Your account was successfully confirmed.
      """
    When I fill form on login page
    And I submit form on login page
    Then I should be logged in the system
    And I should be redirected to home page

  @p1
  Scenario: user can not sign up with blank data
    Given sign up page of web application
    When I fill form on sign up page with blank data
    And I submit sign up form on sign up page
    Then I should see following text on sign up page:
    """
    2 errors must be fixed Email can't be blank Password can't be blank
    """

  @p1
  Scenario: user can not sign up with incorrect data
    Given sign up page of web application
    When I fill form on sign up page with not email data
    Then I should see following text on sign up page:
     """
     1 error must be fixed Email can't be blank
     """
    When I fill form on sign up page with short password
    And I submit sign up form on sign up page
    # Then I should not be logged in the system
    And I should see following text on sign up page:
     """
     1 error must be fixed Password is too short (minimum is 8 characters)
     """
    When I fill form on sign up page with different password data
    And I submit sign up form on sign up page
    # Then I should not be logged in the system
    And I should see following text on sign up page:
     """
     1 error must be fixed Password confirmation doesn't match Password
     """

  @p1
  Scenario: user cannot sign up with duplicated email
    Given there is registered user
    And sign up page of web application
    When I fill form on sign up page
    And I submit sign up form on sign up page
    And I should see following text on sign up page:
    """
    1 error must be fixed Email has already been taken
    """

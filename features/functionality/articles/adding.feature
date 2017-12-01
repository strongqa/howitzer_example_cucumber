Feature: Article Adding
  As a user
  I want to add a new article
  So other users can see my article

  Background:
    Given I am logged in as admin user
    And I am on article list page

  Scenario: user can add article with correct data
    When I click new article on article list page
    And I fill form on new article page
    And I submit form on new article page
    Then I should see article parameters on article page
    When I open article list page
    Then I should see article parameters on article list page

  @p1
  Scenario: user can not add article with blank field
    When I click new article on article list page
    And I fill form on new article page with blank data
    And I submit form on new article page
    Then I should see following text on new article page:
    """
   2 errors prohibited this article from being saved: Title can't be blank Title is too short (minimum is 5 characters)
    """

  @p1
  Scenario: user can not add article with title is too short
    When I click new article on article list page
    And I fill form on new article page with short title
    And I submit form on new article page
    Then I should see following text on new article page:
    """
    1 error prohibited this article from being saved: Title is too short (minimum is 5 characters)
    """
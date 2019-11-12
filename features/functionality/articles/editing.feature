Feature: Article Editing
  As a user 
  I want to edit my article
  So other users can see my edited article

  Background:
    Given I am logged in as admin user
    And there is article
    And I am on article list page

  Scenario: user can edit article with correct credentials
    When I click Edit article button on article list page
    And I fill form on edit article page with new data
    And I submit form on edit article page
    Then I should see new article parameters on article page

  @p1
  Scenario: user can not edit article with blank title
    When I click Edit article button on article list page
    And I fill form on edit article page with blank data
    And I submit form on edit article page
    Then I should see following text on edit article page:
      """
      1 ERROR PROHIBITED THIS ARTICLE FROM BEING SAVED:
      Title can't be blank
      """

  @p1
  Scenario: user can not edit article with title is too short
    When I click Edit article button on article list page
    And I fill form on edit article page with short title
    And I submit form on edit article page
    Then I should see following text on edit article page:
      """
      1 ERROR PROHIBITED THIS ARTICLE FROM BEING SAVED:
      Title is too short (minimum is 5 characters)
      """

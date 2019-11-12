Feature: Article Comment Adding
  As a user
  I want to add a comment to article
  So other users can see my opinion about article

  Background:
    Given there is registered user
    And there is article
    And I am logged in as user
    And opened article page

  Scenario: user can add comment with valid comment body
    When I fill new comment form on article page
    And I submit new comment form on article page
    Then I should see following text on article page:
      """
      Comment was successfully added to current article.
      """
    And I should see user comment on article page

  @p1
  Scenario: user can not add comment with blank comment body
    When I fill new comment form on article page with blank data
    And I submit new comment form on article page
    Then I should see following text on article page:
      """
      Body can't be blank
      """
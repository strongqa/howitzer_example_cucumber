Feature: Article Comment Destroying
  As a user
  I want to delete a comment of article
  So other users can not see my opinion about article

  Background:
    Given I am logged in as admin user
    And there is article
    And there is comment for article
    And opened article page

  Scenario: user can remove comment with confirmation action
    When I destroy comment with confirmation on article page
    Then I should not see comment on article page

  Scenario: user can not remove comment without confirmation action
    When I destroy comment without confirmation on article page
    Then I should see user comment on article page
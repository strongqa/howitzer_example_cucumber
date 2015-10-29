Feature: Article Viewing
  As a user
  I want to view my article
  So I can see what article page includes

  Background:
    Given there is article
    And I am logged in as admin user
    And there is comment for article

  Scenario: admin is viewing article page
    When I navigate to article on article list page
    Then I should see article parameters on article page
    And I should see admin user comment on article page
    And I should see add comment form on article page
    And I should see body field on article page
    And I should see buttons: edit article, destroy comment, create comment on article page
    When I click back to articles link on article page
    Then I should be redirected to article list page
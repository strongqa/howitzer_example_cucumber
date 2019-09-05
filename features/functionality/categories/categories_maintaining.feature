Feature: Category maintaining
  As a  admin
  I want to add a new category for article
  So other users can use it for creation article

  Background:
    Given I am logged in as admin user

  Scenario: admin can add new category
    Given I am on categories list page
    When I click new category button on categories list page
    Then I should be redirected to new category page
    When I crete new category on new category page
    Then I should be redirected to categories list page
    And I should see created category on categories list page
    And I click delete button near nedded category on categories list page

  Scenario: admin can edit existed category
    Given there is category
    And I navigate to categories list page
    When I click edit button near nedded category on categories list page
    Then I should be redirected to edit category page
    When I update name of category on edit category page
    Then I should be redirected to categories list page
    And I should see created category on categories list page
    And I click delete button near nedded category on categories list page

  Scenario: admin can delete existed category
    Given there is category
    And I navigate to categories list page
    When I click delete button near nedded category on categories list page
    Then I should not see category on categories list page

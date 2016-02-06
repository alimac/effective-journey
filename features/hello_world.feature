@api
Feature:
  As a developer,
  I want to know that my module can be enabled

  Scenario: Show module in modules list
    Given I am logged in as a user with the "administrator" role
    When I am at "/admin/modules"
    Then I should see text matching "Hello World"
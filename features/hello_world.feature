@api
Feature:
  As a developer,
  I want to know that my module works.

  Scenario: Check that required modules are installed and enabled
    Given I am logged in as a user with the "administrator" role
    When I am at "/admin/modules"
    Then I should see text matching "Hello World"
    And I should see text matching "Features"
    And I should see text matching "content type vocab hello world"
    And the "edit-modules-hello-world-hello-world-enable" checkbox should be checked
    And the "edit-modules-features-features-enable" checkbox should be checked
    And the "edit-modules-features-content-type-vocab-hello-world-enable" checkbox should be checked
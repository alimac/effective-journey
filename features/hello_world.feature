@api
Feature:
  As a developer,
  I want to know that my module works.

  @step1
  Scenario: Check that required modules are installed and enabled
    Given I am logged in as a user with the "administrator" role
    When I am at "/admin/modules"
    Then I should see text matching "Hello World"
    And I should see text matching "Features"
    And I should see text matching "content type vocab hello world"
    And the "edit-modules-hello-world-hello-world-enable" checkbox should be checked
    And the "edit-modules-features-features-enable" checkbox should be checked
    And the "edit-modules-features-content-type-vocab-hello-world-enable" checkbox should be checked

  @step2
  Scenario Outline: Create terms
    Examples:
    | term     |
    | About Us |
    | Misc     |
    | News     |
    Given a "Sections" term with the name "<term>"
    And I am logged in as a user with the "administrator" role
    When I go to "admin/structure/taxonomy/sections"
    Then I should see the link "<term>"

  @step3
  Scenario Outline: Create nodes with terms
    Examples:
      | title     | sections |
      | Article 1 | News     |
      | Article 2 | News     |
      | Article 3 | About Us |
      | Article 4 | Misc     |
    Given "Sections" terms:
    | name     |
    | About Us |
    | Misc     |
    | News     |
    And "Hello World Article" content:
    | title     | body        | field_sections |
    | Article 1 | Lorem ipsum | News           |
    | Article 2 | Lorem ipsum | News           |
    | Article 3 | Lorem ipsum | About Us       |
    | Article 4 | Lorem ipsum | Misc           |
    When I am on the homepage
    Then I should see the link "<title>"
    And I click "<title>"
    And I should see the link "<sections>"

  @step4
  Scenario: Check that Bartik theme is enabled
    Given I am logged in as a user with the "administrator" role
    When I am at "/admin/appearance"
    Then I should see text matching "Bartik 7.\d+ \(default theme\)"

  @step5 @step5a
  Scenario: Create a custom block
    Given I am logged in as a user with the "administrator" role
    When I am at "/admin/structure/block"
    Then I should see the text "Hello World"
    And the "blocks[hello_world_hello_world][region]" field should contain "sidebar_second"

  @step5 @step5a
  Scenario: Show block on Hello World Article nodes
    Given I am viewing a "Hello World Article" with the title "Article 1"
    Then I should see a "#block-hello-world-hello-world" element
    Then I should see the text "Hello World!" in the "sidebar_second" region

  Scenario: Do not show block on other nodes
    Given I am on the homepage
    Then I should not see a "#block-hello-world-hello-world" element

  Scenario: Do not show block on other nodes
    Given I am viewing a "Basic page" with the title "Page 1"
    Then I should not see a "#block-hello-world-hello-world" element

  @step5 @step5b
  Scenario: Show links to Hello World Article nodes
    Given "Sections" terms:
      | name     | field_enabled |
      | About Us | 1             |
      | Misc     | 1             |
      | News     | 0             |
    And "Hello World Article" content:
      | title     | field_sections |
      | Article 1 | News           |
      | Article 2 | News           |
      | Article 3 | About Us       |
      | Article 4 | Misc           |
    And "Basic page" content:
      | title  |
      | Page 1 |
    And I am viewing a "Hello World Article" with the title "Article 5"
    Then I should not see the link "Article 1" in the "sidebar_second" region
    And I should not see the link "Article 2" in the "sidebar_second" region
    And I should see the link "Article 3" in the "sidebar_second" region
    And I should see the link "Article 4" in the "sidebar_second" region
    And I should not see the link "Article 5" in the "sidebar_second" region
    And I should not see the link "Page 1" in the "sidebar_second" region

  @step5 @step5c
  Scenario: Hello World Article nodes should have a "Content starts here!" line
    Given I am viewing a "Hello World Article" with the title "Article 1"
    Then the ".node-hello-world-article.node-full .content > :nth-child(1)" element should contain "Content starts here!"

    Given I am on the homepage
    Then I should not see the text "Content starts here!"

    Given I am viewing a "Basic page" with the title "Page 1"
    Then I should not see the text "Content starts here!"

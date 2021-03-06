@no-txn
Feature: Indexing Translations
  In order to search translated websites
  Developers
  Should be able to use ts-globalize3 to index their translation tables

  Scenario: Translated fields should be indexed
    Given Sphinx is running
    And I am searching on resources
    When I search for "Desiring God"
    Then I should get 1 result

    When I search for "Deseando Dios"
    Then I should get 1 result

  Scenario: Searching by locale
    Given Sphinx is running
    And I am searching on resources

    When I filter by en on locale

    When I search for "Desiring God"
    Then I should get 1 result

    When I search for "Deseando Dios"
    Then I should get 1 result

    When I filter by es on locale

    When I search for "Desiring God"
    Then I should get 1 result

    When I search for "Deseando Dios"
    Then I should get 1 result

    When I filter by fr on locale

    When I search for "Desiring God"
    Then I should get 0 result

    When I search for "Deseando Dios"
    Then I should get 0 result

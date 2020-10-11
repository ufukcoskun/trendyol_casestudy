@Journey @UI
Feature: UI Tests

  Scenario: validate all boutique pages and add a random item to cart
    Given I visit trendyol login page
    And I login with a valid user
    And I check if i am login correctly
    When I click "kadin" category menu link
    And I check if i am at "/butik/liste/kadin" path
    When I click "erkek" category menu link
    And I check if i am at "/butik/liste/erkek" path
    When I click "cocuk" category menu link
    And I check if i am at "/butik/liste/cocuk" path
    When I click "ev--yasam" category menu link
    And I check if i am at "/butik/liste/ev--yasam" path
    When I click "supermarket" category menu link
    And I check if i am at "/butik/liste/supermarket" path
    When I click "kozmetik" category menu link
    And I check if i am at "/butik/liste/kozmetik" path
    When I click "ayakkabi--canta" category menu link
    And I check if i am at "/butik/liste/ayakkabi--canta" path
    When I click "saat--aksesuar" category menu link
    And I check if i am at "/butik/liste/saat--aksesuar" path
    When I click "elektronik" category menu link
    And I check if i am at "/butik/liste/elektronik" path
    And I go to a random boutique
    And I click to first campaign
    And I click to first product
    And I add to basket an item
    And I check added an item to basket
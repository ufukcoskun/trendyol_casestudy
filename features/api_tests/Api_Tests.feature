@Test @API
Feature: Api_Tests

  Background:
    Given this is an API test scenario

  Scenario: ShouldReturn200_When_GetAllBooks
    Given I get all books in store
    Then I check if response code is "200"
    And I check response msg for no book in store

  Scenario: ShouldReturn200_When_GetABook
    Given I get a book with "123456" id
    Then I check if response code is "200"

  Scenario: ShouldReturn200_When_AddABook
    Given I add a book
      | book_author | book_title |
      | John Smith  | SRE 101    |
    Then I check if response code is "200"

  Scenario: ShouldReturn400_When_AddADuplicateBook
    Given I add a book
      | book_author | book_title |
      | John Smith  | SRE 101    |
    Then I check if response code is "400"
    And I check if error message is "Another book with similar title and author already exists."

  Scenario: ShouldReturn400_When_BookAuthorIsRequired
    Given I try adding a book without author
      | book_title      |
      | DevOps is a lie |
    Then I check if response code is "400"
    And I check if error message is "Field 'author' is required."

  Scenario: ShouldReturn400_When_BookTitleIsRequired
    Given I try adding a book without title
      | book_author |
      | Jane Archer |
    Then I check if response code is "400"
    And I check if error message is "Field 'title' is required."

  Scenario: ShouldReturn400_When_BookAuthorIsNull
    Given I add a book
      | book_author | book_title      |
      |             | DevOps is a lie |
    Then I check if response code is "400"
    And I check if error message is "Field 'author' cannot be empty."

  Scenario: ShouldReturn400_When_BookTitleIsNull
    Given I add a book
      | book_author | book_title |
      | Jane Archer |            |
    Then I check if response code is "400"
    And I check if error message is "Field 'title' cannot be empty."

  Scenario: ShouldReturn400_When_BookIdIsReadOnly
    Given I trying adding a book but book id is read-only
      | book_id | book_author | book_title      |
      | 012345  | Jane Archer | DevOps is a lie |
    Then I check if response code is "400"
    And I check if error message is "Id field is read−only."

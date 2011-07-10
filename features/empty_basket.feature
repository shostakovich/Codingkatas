Feature: Basket calculates price off books
  In order to find the best deal
  As a customer
  I want the basket to calculate the lowest price for a collection off books

  Scenario: Empty basket
    Given An empty basket
    Then The price should be 0.00

  Scenario: Empty basket
    Given An empty basket
    When I add book 1 in the series 1 times
    Then The price should be 8.00


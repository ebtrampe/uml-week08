Feature: Calculator
  Scenario: Sum two numbers
    Given I have two numbers: 1 and 2
    When the calculator sums them
    Then I receive 3 as a result
  Scenario: Divide 2 numbers
    Given two numbers: 8 and 2
    When the calculator divides them
    Then I receive 4 as quotient
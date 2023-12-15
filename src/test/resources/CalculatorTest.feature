Feature: calculator tests

  Scenario Outline: positive addition test cases
    Given calculator is up
    When user enters "<firstNumber>" as a first number
    And user enters "<secondNumber>" as a second number
    And user enters "<operationType>" as an operation type
    Then they receive "<expectedResult>" as the result
    Examples:
      | firstNumber   | secondNumber      | operationType | expectedResult    |
      | 1             | 2                 | +             | 3                 |
      | 0.1           | 0.002             | +             | 0.102             |
      | 0,1           | -0,1              | +             | 0.0               |
      | 123.4         | -123.45           | +             | -0.05             |
      | 0.00000000001 | 0.000000000000001 | +             | 0.000000000010001 |

  Scenario Outline: positive multiplication test cases
    Given calculator is up
    When user enters "<firstNumber>" as a first number
    And user enters "<secondNumber>" as a second number
    And user enters "<operationType>" as an operation type
    Then they receive "<expectedResult>" as the result
    Examples:
      | firstNumber   | secondNumber        | operationType | expectedResult  |
      | 1             | 2                   | *             | 2               |
      | 0.1           | 0.002               | *             | 0.0002          |
      | 0             | -123423464524234342 | *             | 0               |
      | 123.4         | -123.45             | *             | -15233.730      |
      | 123,4         | -123,45             | *             | -15233.730      |
      | 0.00000000001 | 0.01                | *             | 0.0000000000001 |

  Scenario Outline: numbers validation test cases
    Given calculator is up
    When user enters "<firstNumber>" as a first number
    And user enters "<secondNumber>" as a second number
    And user enters "<operationType>" as an operation type
    Then they receive "<expectedResult>" as the result
    Examples:
      | firstNumber       | secondNumber      | operationType | expectedResult                 |
      | sfsdfs            | 2                 | +             | Error: Incorrect number format |
      |                   | 2                 | +             | Error: Incorrect number format |
      | 2                 |                   | +             | Error: Incorrect number format |
      | 4                 | sdfsdf            | *             | Error: Incorrect number format |
      | !@#@$#%^$%&^&&()/ | -123.45           | +             | Error: Incorrect number format |
      | 0.001             | !@#@$#%^$%&^&&()/ | *             | Error: Incorrect number format |

  Scenario Outline: operation type test cases
    Given calculator is up
    When user enters "<firstNumber>" as a first number
    And user enters "<secondNumber>" as a second number
    And user enters "<operationType>" as an operation type
    Then they receive "<expectedResult>" as the result
    Examples:
      | firstNumber   | secondNumber      | operationType | expectedResult                  |
      | 1             | 2                 | /             | 3                               |
      | 0.1           | 0.002             | -             | 0.102                           |
      | 0.1           | 0.002             | d             | 0.102                           |
      | 0.1           | 0.002             | %             | 0.102                           |
      | 1             | 2                 |               | Error: Incorrect operation type |
      | 123.4         | -123.45           | +-            | Error: Incorrect operation type |
      | 0.00000000001 | 0.000000000000001 | *7            | Error: Incorrect operation type |
      | 0.00000000001 | 0.000000000000001 | fsmfs         | Error: Incorrect operation type |


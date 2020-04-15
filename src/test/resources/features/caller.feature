Feature: Test the call 

#the difference with variable scoping in 'isolated' and 'shared' mode
#since call is 'pass by reference' you need to clone using 'copy' if needed

Scenario: isolated scope - called feature does not over-write variables
    Given def someString = 'before'
    And def someJson = { value: 'before' }
    When def result = call read('called.feature')
    Then match someString == 'before'
    Then match someJson == { value: 'before' }
    Then assert typeof fromCalled == 'undefined'
    And assert result.someString == 'after'

Scenario: shared scope - called feature will over-write (and contribute) variables
    Given def someString = 'before'
    And def someJson = { value: 'before' }
    When call read('called.feature')
    Then match someString == 'after'
    And match someJson == { value: 'after' }
    And match fromCalled == { hello: 'world' }
    
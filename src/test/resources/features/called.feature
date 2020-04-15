Feature: called file that may or may not over-write variable in caller

Scenario:
Given def someString = 'after'
And def someJson = { value: 'after' }
And def fromCalled = { hello: 'world' }
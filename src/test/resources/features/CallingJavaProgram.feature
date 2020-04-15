Feature: Verifying Calling JavaProgram Scenario

Scenario: Verifying Calling JavaProgram

Given def JavaDemo = Java.type('com.qa.utilities.JavaDemo')
When def result = JavaDemo.doWorkStatic('world')
And assert result == 'hello world'


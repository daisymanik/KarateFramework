Feature: To test the keywords in re-use index 

  Scenario: Verifying the POST API for assert
    Given url 'https://reqres.in/api/users'
    And request { name: 'Test' , job: 'ProjectLead'}
    And header Accept = 'application/json'
    When method POST
    Then status 201
    
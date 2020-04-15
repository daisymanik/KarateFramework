Feature: Verifying GET Method
#TC01_Verify the API when all mandatory and optional parameters sent

@smokeTest
Scenario: TC01_Verifying the GET Endpoint
Given url apiURL
And print apiURL
When method GET
Then status 200
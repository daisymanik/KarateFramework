Feature: Verifying RunIndex 

@smokeTest 
Scenario: TC01_Get Specific pet details from Petstore 
	Given url 'https://petstore.swagger.io/v2/pet/6' 
	And request { petId: 6 } 
	When method GET 
	Then status 200 
	
@smokeTest 
Scenario: TC02_Verifying the GET Endpoint 
	Given url 'https://reqres.in/api/users' 
	When method GET 
	Then status 200 
	
@smokeTest 
Scenario: TC03_Verifying the Response contains certain fields 
	Given url 'https://reqres.in/api/users/2' 
	When method GET 
	Then status 200 
	And match response == {"data":{id:2, email:"janet.weaver@reqres.in", first_name:"Janet", last_name:"Weaver", avatar:"https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg"}} 
	And match response.data contains {email:"janet.weaver@reqres.in"} 
	
	
@negative 
Scenario: TC05_Testing an invalid GET endpoint - 404 
	Given url 'https://reqres.in/api/users/2786' 
	When method GET 
	Then status 404 
	
@negative 
Scenario: TC06_Verifing an Authentication failed request - 401 
	Given url 'https://gorest.co.in/public-api/users?' 
	When method GET 
	Then status 404 
	
@countryCode=TEST 
Scenario Outline:
TC07_Testing Tags with Specific rows to repeat the Examples section for each tag 

	Given url 'https://sandbox.apihub.citi.com/gcb/api/clientCredentials/oauth2/token/au/gcb' 
	And form field grant_type = 'client_credentials' 
	And form field scope = '/api' 
	And headers { 'Authorization' : 'Basic MzhiZDY2YTUtM2JmYy00NWQ2LWFhNGEtZDNjMGZmNGRhNzNmOmRFN2pSMXRUM2pGMHdSNGRBNHdPN3ZVNHBNNmhWNWJHOHhNMnBYN25KN2RCMWRHN3RS' , 'uuid' : 'b7f91859-6fc2-4a06-bc37-483abd6dd7c0' , 'Accept' : 'application/json' , 'countryCode': 'AU' , 'businessCode' : 'GCB' } 
	When method POST 
	Then status 200 
	Then print response 
	Then def vals = karate.tagValues 
	Then match vals.countryCode[0] == '<expected>' 
	Then print vals 
	
	
	Examples: 
		| expected |
		| US       |
		
		##@countryCode=AU
		#
		#Examples:
		#| expected |
		#| AU  |

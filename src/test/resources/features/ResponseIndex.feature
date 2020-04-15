Feature: Verifying Response Methods

Scenario: TC01_Verifying request response with response

Given url 'https://reqres.in/api/users/2'
When method GET
Then status 200
And match response == '{"data":{id:2, email:"janet.weaver@reqres.in", first_name:"Janet", last_name:"Weaver", avatar:"https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg"}}'


#Scenario: TC02_Verifying binary content response with ResponseBytes


Scenario: TC03_Verifying Request with responseStatus
Given url 'https://sandbox.apihub.citi.com/gcb/api/clientCredentials/oauth2/token/au/gcb'
And form field grant_type = 'client_credentials'
And form field scope = '/api' 
And headers { 'Authorization' : 'Basic MzhiZDY2YTUtM2JmYy00NWQ2LWFhNGEtZDNjMGZmNGRhNzNmOmRFN2pSMXRUM2pGMHdSNGRBNHdPN3ZVNHBNNmhWNWJHOHhNMnBYN25KN2RCMWRHN3RS' , 'uuid' : 'b7f91859-6fc2-4a06-bc37-483abd6dd7c0' , 'Accept' : 'application/json' , 'countryCode': 'AU' , 'businessCode' : 'GCB' }
When method POST
Then status 200
Then def uploadStatusCode = responseStatus
Then assert responseStatus == 200 

Scenario: TC04_Verifying Request with responseHeaders

Given url 'https://sandbox.apihub.citi.com/gcb/api/clientCredentials/oauth2/token/au/gcb'
And form field grant_type = 'client_credentials'
And form field scope = '/api' 
And headers { 'Authorization' : 'Basic MzhiZDY2YTUtM2JmYy00NWQ2LWFhNGEtZDNjMGZmNGRhNzNmOmRFN2pSMXRUM2pGMHdSNGRBNHdPN3ZVNHBNNmhWNWJHOHhNMnBYN25KN2RCMWRHN3RS' , 'uuid' : 'b7f91859-6fc2-4a06-bc37-483abd6dd7c0' , 'Accept' : 'application/json' , 'countryCode': 'AU' , 'businessCode' : 'GCB' }
When method POST
Then status 200
And def strAccTok = $.access_token
And print strAccTok

#Scenario: TC05_Verifying Request with responseCookies

Scenario: TC06_Verifying Request with responseTime
Given url 'https://sandbox.apihub.citi.com/gcb/api/clientCredentials/oauth2/token/au/gcb'
And form field grant_type = 'client_credentials'
And form field scope = '/api' 
And headers { 'Authorization' : 'Basic MzhiZDY2YTUtM2JmYy00NWQ2LWFhNGEtZDNjMGZmNGRhNzNmOmRFN2pSMXRUM2pGMHdSNGRBNHdPN3ZVNHBNNmhWNWJHOHhNMnBYN25KN2RCMWRHN3RS' , 'uuid' : 'b7f91859-6fc2-4a06-bc37-483abd6dd7c0' , 'Accept' : 'application/json' , 'countryCode': 'AU' , 'businessCode' : 'GCB' }
When method POST
Then status 200
And assert responseTime < 1000

#Scenario: TC07_Verifying Request with requestTimeStamp 
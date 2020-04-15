Feature: Verifying the Sandbox apihub URLs



#Background:
#And def AddRequest = read("PersonalDomesticPreprocessor_Req.json")
#And print AddRequest
##Resource Owner
#Given url 'https://sandbox.apihub.citi.com/gcb/api/password/oauth2/token/au/gcb'
#And form field grant_type = 'password'
#And form field scope = '/api'
#And form field username = 'SandboxUser1'
#And form field password = '74c0acd058faa716325997dcfbfc06548353210ef1b76adf1f285f796e776179179d2e09355e21e3cb17c5c7cfd38d26baf037a217c1e6f800a3d79b9e8437373ab8675fa81c9b79258c9d97a09fe04814cd5264393da5e491c2f7a8e0c43b102c000d758a7782a84952bd085922ca52f2b4dc736c588cdf8e92a310f2175e5b9ff917e9b5f58a56bd8dc0505db074ce91a96bf5e3aa29d6cefd97711ade19e8a192d651af715ec1c813f41a33574c0a4aa4cf0bea4ed343a8efd1628f9fdc0534086c991bfb47b1bb80e4c469c6745afc7f6ec7daad6d6038b08c2951d5423c663ec338c89356b1230de2bb5b9ecab39c3926cfe25898a192e3fbb27393b234'
#And headers { 'Authorization' : 'Basic MzhiZDY2YTUtM2JmYy00NWQ2LWFhNGEtZDNjMGZmNGRhNzNmOmRFN2pSMXRUM2pGMHdSNGRBNHdPN3ZVNHBNNmhWNWJHOHhNMnBYN25KN2RCMWRHN3RS' , 'uuid' : '9bd81c52-be54-41bf-98de-ad7f2dbba136' , 'Accept' : 'application/json' , 'bizToken' : 'bfNj3iv1iEDvf5wbHLgC13OasPGq1PEo04+E4715bHFE1ZQP+EHkqcOcMX0Ho3KgSkfkjnbzPjFBJmC7oq5RBg==' }
#And request {}
#When method POST
#Then status 200
#And print response
#And def strAccTok = $.access_token
##And print strAccTok
#And def strAuthorization = 'Bearer' +strAccTok
##And print strAuthorization
#And def strRefTok = $.refresh_token
#And print strRefTok

@ClientCredientials
Scenario: #Client Credientials

#Client Credientials
Given url 'https://sandbox.apihub.citi.com/gcb/api/clientCredentials/oauth2/token/au/gcb'
And form field grant_type = 'client_credentials'
And form field scope = '/api' 
And headers { 'Authorization' : 'Basic MzhiZDY2YTUtM2JmYy00NWQ2LWFhNGEtZDNjMGZmNGRhNzNmOmRFN2pSMXRUM2pGMHdSNGRBNHdPN3ZVNHBNNmhWNWJHOHhNMnBYN25KN2RCMWRHN3RS' , 'uuid' : 'b7f91859-6fc2-4a06-bc37-483abd6dd7c0' , 'Accept' : 'application/json' , 'countryCode': 'AU' , 'businessCode' : 'GCB' }
When method POST
Then status 200
And def strAccTok = $.access_token
And print strAccTok
And def strAuthorization = 'Bearer ' +strAccTok
#And print strAuthorization

@#E2EKey
Scenario: #E2E Key

Given url 'https://sandbox.apihub.citi.com/gcb/api/security/e2eKey'
And headers {'client_id' : '38bd66a5-3bfc-45d6-aa4a-d3c0ff4da73f', 'uuid' : 'a6bc838c-5526-41a4-bca5-131df41f1821' , 'Accept' : 'application/json' ,'Authorization' : '#(strAuthorization)'   }
When method GET
Then status 200
And def strBizToken = responseHeaders['bizToken'][0]
And def strEventId = responseHeaders['eventid'][0]
And def strModulus = $.modulus
And def strExponent = $.exponent
#And print strBizToken
#And print strEventId
#And print strModulus
#And print strExponent

@ResourceOwner
Scenario: ResourceOwner
Given url 'https://sandbox.apihub.citi.com/gcb/api/password/oauth2/token/au/gcb'
And form field grant_type = 'password'
And form field scope = '/api'
And form field username = 'SandboxUser1'
And form field password = '74c0acd058faa716325997dcfbfc06548353210ef1b76adf1f285f796e776179179d2e09355e21e3cb17c5c7cfd38d26baf037a217c1e6f800a3d79b9e8437373ab8675fa81c9b79258c9d97a09fe04814cd5264393da5e491c2f7a8e0c43b102c000d758a7782a84952bd085922ca52f2b4dc736c588cdf8e92a310f2175e5b9ff917e9b5f58a56bd8dc0505db074ce91a96bf5e3aa29d6cefd97711ade19e8a192d651af715ec1c813f41a33574c0a4aa4cf0bea4ed343a8efd1628f9fdc0534086c991bfb47b1bb80e4c469c6745afc7f6ec7daad6d6038b08c2951d5423c663ec338c89356b1230de2bb5b9ecab39c3926cfe25898a192e3fbb27393b234'
And headers { 'Authorization' : 'Basic MzhiZDY2YTUtM2JmYy00NWQ2LWFhNGEtZDNjMGZmNGRhNzNmOmRFN2pSMXRUM2pGMHdSNGRBNHdPN3ZVNHBNNmhWNWJHOHhNMnBYN25KN2RCMWRHN3RS' , 'uuid' : '9bd81c52-be54-41bf-98de-ad7f2dbba136' , 'Accept' : 'application/json' , 'bizToken' : 'bfNj3iv1iEDvf5wbHLgC13OasPGq1PEo04+E4715bHFE1ZQP+EHkqcOcMX0Ho3KgSkfkjnbzPjFBJmC7oq5RBg==' }
And request {}
When method POST
Then status 200
And print response
And def strAccTok = $.access_token
#And print strAccTok
And def strAuthorization = 'Bearer ' +strAccTok
#And print strAuthorization
And def strRefTok = $.refresh_token
And print strRefTok

@AccountSummary
Scenario: AccountSummary
Given url 'https://sandbox.apihub.citi.com/gcb/api/v1/accounts'
And headers { 'Authorization' : '#(strAuthorization)' , 'uuid' : '78ab01d8-e68b-4c8f-8b79-ebcadb83b1bb' , 'Accept' : 'application/json' , 'Client_id' : '38bd66a5-3bfc-45d6-aa4a-d3c0ff4da73f' }
When method GET
Then status 200
And print response

@PersonalDomesticPreprocessor
Scenario: PersonalDomesticPreprocessor
#AccountSummary
Given url 'https://sandbox.apihub.citi.com/gcb/api/v1/moneyMovement/externalDomesticTransfer/preprocess'
And headers { 'Authorization' : '#(strAuthorization)' , 'uuid' : '78ab01d8-e68b-4c8f-8b79-ebcadb83b1bb' , 'Accept' : 'application/json' , 'Client_id' : '38bd66a5-3bfc-45d6-aa4a-d3c0ff4da73f' }
And request { "sourceAccountId" : "41375159436b366b32335a6b566d53315753684d2b69464f43427347654b496e2f6a4f6d4971546e622f773d" , "transactionAmount" : "20" , "payeeId" : "3970304a4d2b432f453739362b46716630304b756256464869626b4c615565493243442f6f734438534f673d" , "transferCurrencyIndicator" : "SOURCE_ACCOUNT_CURRENCY" , "chargeBearer" : "SHARED" , "paymentMethod" : "GIRO" , "remarks" : "GOOD" }
When method POST
Then status 200
And print response
And print responseHeaders 


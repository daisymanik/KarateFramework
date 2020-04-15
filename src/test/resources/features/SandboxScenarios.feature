Feature: Verifying the Sandbox apihub URLs

Background:

And def PreRequiste = call read("CustomerProfile.feature@ResourceOwner")
And print PreRequiste.response
And def strAuthorization = PreRequiste.strAuthorization
And print strAuthorization



@AccountSummary
Scenario: TC01_Veriying the accountGroupSummary API  when all mandatory parameters sent
#AccountSummary
Given url 'https://sandbox.apihub.citi.com/gcb/api/v1/accounts'
And headers { 'Authorization' : '#(strAuthorization)' , 'uuid' : '78ab01d8-e68b-4c8f-8b79-ebcadb83b1bb' , 'Accept' : 'application/json' , 'Client_id' : '38bd66a5-3bfc-45d6-aa4a-d3c0ff4da73f' }
When method GET
Then status 200
And print response


Feature: Verifying HTTP Core Keywords 

Scenario: TC01_Verifying the URL scenario 

	Given url 'https://gorest.co.in/public-api/users' 
	#Given url 'https://' + e2eHostName + '/v1/api'
	When method GET 
	Then status 200 
	
Scenario: TC02_Verifying the PATH scenario 
	Given url 'https://petstore.swagger.io/#/pet/addPet' 
	And request read('file:D:\\KarateFramework\\src\\test\\resources\\Payloads\\HttpIndex.json') 
	When method post 
	Then status 405 
	And match response == {id = '#notnull', name: 'doggie' } 
	Given path response.id 
	When method get 
	Then status 200 
	
Scenario: TC03_Verifying the REQUEST scenario 
	Given url 'https://sandbox.apihub.citi.com/gcb/api/v1/moneyMovement/externalDomesticTransfer/preprocess' 
	And headers { 'Authorization' : '#(strAuthorization)' , 'uuid' : '78ab01d8-e68b-4c8f-8b79-ebcadb83b1bb' , 'Accept' : 'application/json' , 'Client_id' : '38bd66a5-3bfc-45d6-aa4a-d3c0ff4da73f' } 
	And request { "sourceAccountId" : "41375159436b366b32335a6b566d53315753684d2b69464f43427347654b496e2f6a4f6d4971546e622f773d" , "transactionAmount" : "20" , "payeeId" : "3970304a4d2b432f453739362b46716630304b756256464869626b4c615565493243442f6f734438534f673d" , "transferCurrencyIndicator" : "SOURCE_ACCOUNT_CURRENCY" , "chargeBearer" : "SHARED" , "paymentMethod" : "GIRO" , "remarks" : "GOOD" } 
	When method POST 
	Then status 200 
	And print response 
	
Scenario: TC04_Verifying the REQUEST  reading from file scenario 
	Given url 'https://reqres.in/api/users' 
	And request read('file:D:\\KarateFramework\\src\\test\\resources\\Payloads\\UsersInput.json') 
	When method POST 
	Then status 201 
	
Scenario: using the karate retry syntax 
# if not configured, 'retry' defaults to
# { count: 3, interval: 3000 } (milliseconds)
	* configure retry = { count: 5, interval: 0 }
	Given url demoBaseUrl 
	And path 'greeting' 
	And retry until responseStatus == 200 && response.id > 3 
	When method get 
	
	@retry 
Scenario: Verifying the Retry Until 
	Given url 'https://reqres.in/api/users?page=2' 
	When method GET 
	And retry until response.id > 3 
	Then status 200
	
	
	#The SOAPAction filter enables you to identify an incoming XML message based on the SOAPAction HTTP header in the message
Scenario: soap 1.1 
	Given request 
		"""
    <?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
        <Add xmlns="http://tempuri.org/">
          <intA>2</intA>
          <intB>3</intB>
        </Add>
      </soap:Body>
    </soap:Envelope>
    """
	When soap action 'http://tempuri.org/Add' 
	Then status 200 
	And match /Envelope/Body/AddResponse/AddResult == 5 
	And print 'response: ', response 
	

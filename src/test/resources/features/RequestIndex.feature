Feature: Verifying Request Methods 


Scenario: Verifying Request with param request 

	Given url 'https://reqres.in/api/users' 
	And param page = '2' 
	When method GET 
	Then status 200 
	
Scenario: Verifying Request with header 

	Given url 'https://sandbox.apihub.citi.com/gcb/api/clientCredentials/oauth2/token/au/gcb' 
	And form field grant_type = 'client_credentials' 
	And form field scope = '/api' 
	And headers { 'Authorization' : 'Basic MzhiZDY2YTUtM2JmYy00NWQ2LWFhNGEtZDNjMGZmNGRhNzNmOmRFN2pSMXRUM2pGMHdSNGRBNHdPN3ZVNHBNNmhWNWJHOHhNMnBYN25KN2RCMWRHN3RS' , 'uuid' : 'b7f91859-6fc2-4a06-bc37-483abd6dd7c0' , 'Accept' : 'application/json' , 'countryCode': 'AU' , 'businessCode' : 'GCB' } 
	When method POST 
	Then status 200 
	
	
	
Scenario: Verifying Request with form field 

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
	
	
Scenario: Verifying post request by uploading image with multipart file 
	Given url 'https://v2.convertapi.com/upload' 
	And multipart file myFile = { read: 'file:D:\\KarateFramework\\src\\test\\resources\\Payloads\\Tough.jpg', filename: 'Tough.jpg', contentType: 'image/jpg' } 
	And multipart field message = 'hello world' 
	When method post 
	Then status 200 
	
Scenario: Verifying Request with headers 

	Given url 'https://sandbox.apihub.citi.com/gcb/api/clientCredentials/oauth2/token/au/gcb' 
	And form field grant_type = 'client_credentials' 
	And form field scope = '/api' 
	And headers { 'Authorization' : 'Basic MzhiZDY2YTUtM2JmYy00NWQ2LWFhNGEtZDNjMGZmNGRhNzNmOmRFN2pSMXRUM2pGMHdSNGRBNHdPN3ZVNHBNNmhWNWJHOHhNMnBYN25KN2RCMWRHN3RS' , 'uuid' : 'b7f91859-6fc2-4a06-bc37-483abd6dd7c0' , 'Accept' : 'application/json' , 'countryCode': 'AU' , 'businessCode' : 'GCB' } 
	When method POST 
	Then status 200 
	
Scenario: Verifying Request with multiple form fields 

	Given url 'https://sandbox.apihub.citi.com/gcb/api/password/oauth2/token/au/gcb' 
	And form field grant_type = 'password' 
	And form field scope = '/api' 
	And form field username = 'SandboxUser1' 
	And form field password = '74c0acd058faa716325997dcfbfc06548353210ef1b76adf1f285f796e776179179d2e09355e21e3cb17c5c7cfd38d26baf037a217c1e6f800a3d79b9e8437373ab8675fa81c9b79258c9d97a09fe04814cd5264393da5e491c2f7a8e0c43b102c000d758a7782a84952bd085922ca52f2b4dc736c588cdf8e92a310f2175e5b9ff917e9b5f58a56bd8dc0505db074ce91a96bf5e3aa29d6cefd97711ade19e8a192d651af715ec1c813f41a33574c0a4aa4cf0bea4ed343a8efd1628f9fdc0534086c991bfb47b1bb80e4c469c6745afc7f6ec7daad6d6038b08c2951d5423c663ec338c89356b1230de2bb5b9ecab39c3926cfe25898a192e3fbb27393b234' 
	And headers { 'Authorization' : 'Basic MzhiZDY2YTUtM2JmYy00NWQ2LWFhNGEtZDNjMGZmNGRhNzNmOmRFN2pSMXRUM2pGMHdSNGRBNHdPN3ZVNHBNNmhWNWJHOHhNMnBYN25KN2RCMWRHN3RS' , 'uuid' : '9bd81c52-be54-41bf-98de-ad7f2dbba136' , 'Accept' : 'application/json' , 'bizToken' : 'bfNj3iv1iEDvf5wbHLgC13OasPGq1PEo04+E4715bHFE1ZQP+EHkqcOcMX0Ho3KgSkfkjnbzPjFBJmC7oq5RBg==' } 
	#And request {}
	When method POST 
	Then status 200 
	And print response 
	
	
Scenario: Verifying Request with cookie 

	Given url 'https://testserver.atlassian.net/rest/api/2/issue' 
	And request read (file:D:\\KarateFramework\\src\\test\\resources\\Payloads\\jira.json) 
	And cookie JSESSIONID = 'bmC5jb20sdsdyYWtpbmczMjE=' 
	When method POST 
	Then status 200 
	
	
Scenario: Verifying Request with cookies 

	Given url 'https://reqres.in/api/users?page=2' 
	When method GET 
	And cookie name = 'morpheus' 
	#And configure cookies = null
	And assert responseCookies['name'].value == 'morpheus' 
	And cookies { someKey: 'someValue', foo: 'bar' } 
	Then status 200
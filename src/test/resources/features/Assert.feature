Feature: Verifying Assert Index 

Scenario: match == 
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
	And match $.token_type == "bearer" 
	
	
Scenario: match != 
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
	And match $.scope != 'test' 
	
	
Scenario: match contains 
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
	And match $.token_type contains "bearer" 
	
	
Scenario: match contains only 
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
	And match $.expires_in contains only 1800 
	
	
Scenario: match contains any 
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
	And match $.expires_in contains any 1800 
	
	
Scenario: match !contains and the short cut for not contains
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
	And match $.token_type !contains "help" 
	And match $.token_type == '#(!^"Hello")'
	
	
Scenario: match header 
	Given url 'https://sandbox.apihub.citi.com/gcb/api/password/oauth2/token/au/gcb' 
	And form field grant_type = 'password' 
	And form field scope = '/api' 
	And form field username = 'SandboxUser1' 
	And form field password = '74c0acd058faa716325997dcfbfc06548353210ef1b76adf1f285f796e776179179d2e09355e21e3cb17c5c7cfd38d26baf037a217c1e6f800a3d79b9e8437373ab8675fa81c9b79258c9d97a09fe04814cd5264393da5e491c2f7a8e0c43b102c000d758a7782a84952bd085922ca52f2b4dc736c588cdf8e92a310f2175e5b9ff917e9b5f58a56bd8dc0505db074ce91a96bf5e3aa29d6cefd97711ade19e8a192d651af715ec1c813f41a33574c0a4aa4cf0bea4ed343a8efd1628f9fdc0534086c991bfb47b1bb80e4c469c6745afc7f6ec7daad6d6038b08c2951d5423c663ec338c89356b1230de2bb5b9ecab39c3926cfe25898a192e3fbb27393b234' 
	And headers { 'Authorization' : 'Basic MzhiZDY2YTUtM2JmYy00NWQ2LWFhNGEtZDNjMGZmNGRhNzNmOmRFN2pSMXRUM2pGMHdSNGRBNHdPN3ZVNHBNNmhWNWJHOHhNMnBYN25KN2RCMWRHN3RS' , 'uuid' : '9bd81c52-be54-41bf-98de-ad7f2dbba136' , 'Accept' : 'application/json' , 'bizToken' : 'bfNj3iv1iEDvf5wbHLgC13OasPGq1PEo04+E4715bHFE1ZQP+EHkqcOcMX0Ho3KgSkfkjnbzPjFBJmC7oq5RBg==' } 
	And request {} 
	When method POST 
	Then status 200 
	And match header Content-Type == 'application/json'
	And print response 
	And print responseheaders 
	
Scenario: Fuzzy matching 
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
	And match $.token_type == "#notnull" 
	And match $.access_token == "#notnull" 
	And match $.expires_in == "#notnull" 
	And match $.consented_on == "#notnull" 
	And match $.scope == "#notnull" 
	And match $.refresh_token == "#notnull" 
	And match $.refresh_token_expires_in == "#notnull" 
	
Scenario: Schema validation 
	Given url 'https://reqres.in/api/users' 
	And request { name: 'Test' , job: 'ProjectLead'} 
	And header Accept = 'application/json' 
	When method POST 
	Then status 201 
	And match response == 
		"""
    {
	   name:'#string',
	   job:'#string',
	   id:'#string',
	   createdAt:'#notnull'
		}
		"""
		
		
Scenario: match for JSON Array 
	Given def cat = 
		"""
  {
    name: 'Billie',
    kittens: [
      { id: 23, name: 'Bob' },
      { id: 42, name: 'Wild' }
    ]
  }
  """
		# normal 'equality' match. note the wildcard '*' in the JsonPath (returns an array)
	Then match cat.kittens[*].id == [23, 42] 
	
	# when inspecting a json array, 'contains' just checks if the expected items exist
	# and the size and order of the actual array does not matter
	Then match cat.kittens[*].id contains 23 
	Then match cat.kittens[*].id contains [42] 
	Then match cat.kittens[*].id contains [23, 42] 
	Then match cat.kittens[*].id contains [42, 23] 
	
	# the .. operator is great because it matches nodes at any depth in the JSON "tree"
	Then match cat..name == ['Billie', 'Bob', 'Wild'] 
	
	# and yes, you can assert against nested objects within JSON arrays !
	Then match cat.kittens contains [{ id: 42, name: 'Wild' }, { id: 23, name: 'Bob' }] 
	
	# ... and even ignore fields at the same time !
	Then match cat.kittens contains { id: 42, name: '#string' } 
	
Scenario: match each for JSON Array 
	Given def json = 
		"""
  {
    "hotels": [
      { "roomInformation": [{ "roomPrice": 618.4 }], "totalPrice": 618.4  },
      { "roomInformation": [{ "roomPrice": 679.79}], "totalPrice": 679.79 }
    ]
  }
  """
	Then match each json.hotels contains { totalPrice: '#? _ == _$.roomInformation[0].roomPrice' } 
	# when validation logic is an 'equality' check, an embedded expression works better
	Then match each json.hotels contains { totalPrice: '#(_$.roomInformation[0].roomPrice)' } 
	
	

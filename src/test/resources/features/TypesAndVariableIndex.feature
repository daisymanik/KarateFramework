Feature: Verifying Types Index and Variables with examples 


Scenario: Verifying Json Sceario 

	Given url 'https://reqres.in/api/users/2' 
	When method GET 
	Then status 200 
	And match response == {"data":{id:2, email:"janet.weaver@reqres.in", first_name:"Janet", last_name:"Weaver", avatar:"https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg"}} 
	#And def json = {"data":{id:2, email:"janet.weaver@reqres.in", first_name:"Janet", last_name:"Weaver", avatar:"https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg"}}
	And  match response.data contains { id: 2}} 
	And print response 
	
	
Scenario: Verifying the POST API for using Embedded Expressions 

	Given url 'https://reqres.in/api/users' 
	And request { name: 'FileNew' , job: 'ATM'} 
	And def user = { name: 'RaviShankar',  job: 'ProjectLead' } 
	When method POST 
	Then status 201 
	And def session = {name: '#(user.name)',job:'#(user.job)'} 
	#And print user
	
	
Scenario: Verifying the Reading JSON Files 
	Given url 'https://sandbox.apihub.citi.com/gcb/api/v1/moneyMovement/externalDomesticTransfer/preprocess' 
	And def AddRequest = read("D:\\KarateFramework\\src\\test\\resources\\Payloads\\PersonalDomesticPreprocessor_Req.json") 
	And print AddRequest 
	
	
Scenario: Verifying the Reading TEXT Files
	Given url 'https://sandbox.apihub.citi.com/gcb/api/v1/moneyMovement/externalDomesticTransfer/preprocess' 
	And def AddRequest = read("D:\\KarateFramework\\src\\test\\resources\\Payloads\\PersonalDomesticPreprocessor_Req.txt") 
	And print AddRequest 
	
	
Scenario: Verifying the Reading XML Files
	Given url 'https://sandbox.apihub.citi.com/gcb/api/v1/moneyMovement/externalDomesticTransfer/preprocess' 
	And def AddRequest = read("D:\\KarateFramework\\src\\test\\resources\\Payloads\\PersonalDomesticPreprocessor_Req.xml") 
	And print AddRequest 
	
	
Scenario: Verifying the Reading YAML Files  
	Given url 'https://sandbox.apihub.citi.com/gcb/api/v1/moneyMovement/externalDomesticTransfer/preprocess' 
	And def AddRequest = read("D:\\KarateFramework\\src\\test\\resources\\Payloads\\PersonalDomesticPreprocessor_Req.yaml") 
	And print AddRequest 
	
Scenario: Verifying the Reading CSV Files 
	Given url 'https://sandbox.apihub.citi.com/gcb/api/v1/moneyMovement/externalDomesticTransfer/preprocess' 
	And def AddRequest = read("D:\\KarateFramework\\src\\test\\resources\\Payloads\\PersonalDomesticPreprocessor_Req.csv") 
	And print AddRequest 
	
	
	
Scenario: Verifying the Reading PDF Files  
	Given url 'https://sandbox.apihub.citi.com/gcb/api/v1/moneyMovement/externalDomesticTransfer/preprocess' 
	And def AddRequest = read("D:\\Holiday Calendar List - 2019 - India.pdf") 
	And print AddRequest 
	
	
	
Scenario: Verifying the multi-line text Files
	Given url 'https://sandbox.apihub.citi.com/gcb/api/v1/moneyMovement/externalDomesticTransfer/preprocess' 
	And def AddRequest = read("D:\\KarateFramework\\src\\test\\resources\\Payloads\\MultiLine.txt") 
	And match AddRequest == read("D:\\KarateFramework\\src\\test\\resources\\Payloads\\MultiLine.txt").replaceAll("\r","") 
	And print AddRequest 
	
	
Scenario Outline: Verifying the multi-line text Files using ScenarioOutLine 
	Given url 'https://sandbox.apihub.citi.com/gcb/api/v1/moneyMovement/externalDomesticTransfer/preprocess' 
	And def AddRequest = read("D:\\KarateFramework\\src\\test\\resources\\Payloads\\MultiLine.txt") 
	And match AddRequest == read("D:\\KarateFramework\\src\\test\\resources\\Payloads\\MultiLine.txt").replaceAll("\r","") 
	And print AddRequest 
	
	Examples: 
		|name|
		|RaviShankar|
		|PavanKalyan|
		|FileEdit|
		
		
Scenario: Verifying the multi-line string expression 
	Given url 'https://sandbox.apihub.citi.com/gcb/api/v1/moneyMovement/externalDomesticTransfer/preprocess' 
	# this is normally never required since you can use replace
	And def name = 'Luke Skywalker' 
	And string expectedOnUnix = '{\n  hero(name: "' + name + '") {\n    height\n    mass\n  }\n}' 
	And string expectedOnWindows = '{\r\n  hero(name: "' + name + '") {\r\n    height\r\n    mass\r\n  }\r\n}' 
	And def actual = read('D:\\KarateFramework\\src\\test\\resources\\Payloads\\MultiLine.txt') 
	And assert actual == expectedOnUnix 
	And print actual 
	
	
Scenario: Verifying the String to Json conversation 
	Given url 'https://reqres.in/api/users' 
	And def strVar = '{ "name": "Ghar More Pardesiya" , "job": "ATM" }' 
	And json jsonVar = strVar 
	And match jsonVar == { name: 'Ghar More Pardesiya', job: 'ATM' } 
	And request { name: 'Ghar More Pardesiya' , job: 'ATM'} 
	When method POST 
	Then status 201 
	And print jsonVar 
	And print strVar 
	
	
@four 
Scenario: Verifying the Json to String conversation 
	Given url 'https://reqres.in/api/users' 
	And def jsonVar = { name : 'NavigationProcess', job : 'WindowLDE339' }
	And string strVar  = jsonVar 
	And assert strVar == '{ name : 'NavigationProcess', job : 'WindowLDE339' }' 
	And match jsonVar == { name: 'Ghar More Pardesiya' } 
	And request { name : 'NavigationProcess', job : 'WindowLDE339' } 
	When method POST 
	Then status 201 
	And print jsonVar 
	And print strVar 
	
Scenario: Validate JSON Type with assert 
	Given def cat = { name: 'Billie', scores: [2, 5] } 
	Then assert cat.scores[1] == 5 
	
Scenario: Validate JSON Type with match 
	Given def cats = [{ name: 'Billie' }, { name: 'Bob' }] 
	Then match cats[1] == { name: 'Bob' } 
	When def first = cats[0] 
	Then match first == { name: 'Billie' } 
	
Scenario: Validate XML Type with assert 
	Given def cat = <cat><name>Billie</name><scores><score>2</score><score>5</score></scores></cat> 
	# sadly, xpath list indexes start from 1
	Then match cat/cat/scores/score[2] == 5 
	# but karate allows you to traverse xml like json !!
	Then match cat.cat.scores.score[1] == '5' 
	
Scenario: having javascript function in feature file 
	Given def greeter = function(title, name) { return 'hello ' + title + ' ' + name } 
	When assert greeter('Mr.', 'Bob') == 'hello Mr. Bob' 
	
Scenario: Reading JSON file for request body from classpath 
	Given url 'https://reqres.in/api/users' 
	And request read('classpath:UsersInput.json') 
	When method POST 
	Then status 201 
	
Scenario: Reading JSON file for request body 
	Given url 'https://reqres.in/api/users' 
	And request read('file:/D:/KarateFramework/src/test/resources/Payloads/UsersInput.json') 
	When method POST 
	Then status 201 
	
Scenario: Passing data through data table 
	Given table cats 
		| name   | age |
		| 'Bob'  | 2   |
		| 'Wild' | 4   |
		| 'Nyan' | 3   |
		
	Then match cats == [{name: 'Bob', age: 2}, {name: 'Wild', age: 4}, {name: 'Nyan', age: 3}] 
	
	
Scenario: Passing data through csv format 
	Given text foo = 
		"""
    name,type
    Billie,LOL
    Bob,Wild
    """
	When csv bar = foo 
	Then match bar == [{ name: 'Billie', type: 'LOL' }, { name: 'Bob', type: 'Wild' }] 
	
Scenario: Example of JSON path filter 
	Given url 'https://reqres.in/api/users' 
	And request read('file:/D:/KarateFramework/src/test/resources/Payloads/UsersInput.json') 
	When method POST 
	Then status 201 
	And match response.name == 'Test' 
	
	
Scenario: Example of JSON path filter 
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
		# find single kitten where id == 23
	When def bob = get[0] cat.kittens[?(@.id==23)] 
	Then match bob.name == 'Bob' 
	
	
Scenario: def keyword 
	Given def myVar = 'world' 
	Then print myVar 
	When def myNum = 5 
	Then match myNum == 5 
	
Scenario: TC01_Verifying def 
	Given url 'https://reqres.in/api/users' 
	And request { name: 'FileNew' , job: 'ATM'} 
	And def user = { name: 'RaviShankar',  job: 'ProjectLead' } 
	When method POST 
	Then status 201 
	Then print user 
	
	

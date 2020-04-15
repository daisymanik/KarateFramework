Feature: To test the keywords in actions index 


Background:
	Given def result = callonce read('calledNormal.feature') 
	And print result.response.job


Scenario: Verifying the POST API for assert 
	Given url 'https://reqres.in/api/users' 
	And request { name: 'Test' , job: 'ProjectLead'} 
	When method POST 
	Then status 201 
	And print response.id 
	And assert response.job == 'ProjectLead' 
	
Scenario: Verifying the POST API for replace keyword 
	Given url 'https://reqres.in/api/users' 
	And json payload = { name: '<name>' , job: '<job>' } 
	And replace payload 
		| token  | value   |
		| name   | 'cruel' |
		| job    | 'good'  |  
	And request payload 
	When method POST 
	Then status 201 
	
Scenario: Verifying the POST API for get 
	Given url 'https://reqres.in/api/users' 
	And request { name: 'Test' , job: 'ProjectLead'} 
	When method POST 
	Then status 201 
	And def job = get response.job 
	And match job == 'ProjectLead' 
	
Scenario: Verifying the POST API for set 
	Given url 'https://reqres.in/api/users' 
	And def payload = { } 
	And set payload $.name = 'Test' 
	And set payload $.job = 'ProjectLead' 
	And request payload 
	When method POST 
	Then status 201 
	And def job = get response.job 
	And match job == 'ProjectLead' 
	
Scenario: Verifying the POST API for remove 
	Given url 'https://reqres.in/api/users' 
	And def payload = { name: 'Test' , job: ['ProjectLead', 'CTO'], id: '10'} 
	And remove payload.id 
	And remove payload $.job[1] 
	And request payload 
	When method POST 
	Then status 201 
	And print response.id 
	And assert response.job[0] == 'ProjectLead' 
	
Scenario: Verifying the POST API for configure 
	Given url 'https://reqres.in/api/users' 
	And configure ssl = { trustAll: true }   # Trusts all the certificates
  And request { name: 'Test' , job: 'ProjectLead'} 
	When method POST 
	Then status 201 
	And print response.id 
	And assert response.job == 'ProjectLead' 
	
Scenario: Verifying the POST API for call 
	Given def result = call read('calledNormal.feature') 
	And assert result.response.job == 'ProjectLead' 
	
	Scenario: Verify the eval keyword
	Given eval
  """
  var foo = function(v){ return v * v };
  var nums = [0, 1, 2, 3, 4];
  var squares = [];
  for (var n in nums) {
    squares.push(foo(n));
  }
  karate.set('temp', squares);
  """
Then match temp == [0, 1, 4, 9, 16]
	

Feature: Verifying POST Method

Scenario: TC01_Testing a POST endpoint with request body
  Given url 'https://reqres.in/api/users'
  And request { name: 'Test' , job: 'ProjectLead'}
  When method POST
  Then status 201
  
  
Scenario: TC02_Verifying the POST API for Invalid status Code
  Given url 'https://reqres.in/api/users'
  And request { name: 'Test' , job: 'ProjectLead'}
  When method POST
  Then status 201
  # And assert.status=201
  
  Scenario: TC03_Verifying the POST API for Invalid inputs
  
  Given url 'https://reqres.in/api/users'
  And request { name: '9889999' , job: '2019202901'}
  When method POST
  Then status 201
  
  Scenario: TC04_Verifying the POST API for using Embedded Expressions
  
  Given url 'https://reqres.in/api/users'
  And request { name: 'FileNew' , job: 'ATM'}
  And def user = { name: 'RaviShankar',  job: 'ProjectLead' }
  When method POST
  Then status 201
  And def session = {name: '#(user.name)',job:'#(user.job)'}
  #And print 'The name is :', name
 # And response { id: '#number', createdAt: '2019-07-28T12:28:53.466Z'}
 #And assert response.data.length == 1
#And match response[0].id == '#number'


  Scenario: TC05_Verifying the PUT API 
  
  Given url 'https://reqres.in/api/users/2'
  And request { name: 'RaviVarma', job: 'Technology Specialist'}
  When method PUT
  Then status 200
  And def session = {name: '#(request.name)',job:'#(request.job)'}
  And print 'The name is :', name
  

  
  
  Scenario: TC06_Verifying the PATCH API 
  Given url 'https://reqres.in/api/users/3'
  And request {name: 'PAVAWANJAGAN', job: 'Technology Specialist' }
  When method patch
  Then status 200
  And def session = {name: '#(request.name)',job:'#(request.job)'}
  And print 'The updated name is :', name
  
  
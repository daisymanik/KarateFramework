Feature: Verifying GET Method 
#TC01_Verify the API when all mandatory and optional parameters sent

@smokeTest 
Scenario: TC01_Verifying the GET Endpoint 
	Given url 'https://reqres.in/api/users' 
	When method GET 
	Then status 200 
	
@smokeTest 
Scenario: TC02_Verifying the Response 
	Given url 'https://reqres.in/api/users/2' 
	When method GET 
	Then status 200 
	And  match response.data contains { id: 2}} 
	
Scenario: TC03_Verifying the Response contains certain fields 
	Given url 'https://reqres.in/api/users/2' 
	When method GET 
	Then status 200 
	And match response == {data={"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg"},"ad":{"company":"StatusCode Weekly","url":"http://statuscode.org/","text":"A weekly newsletter focusing on software development, infrastructure, the server, performance, and the stack end of things."}}
	And match response.data contains {email:"janet.weaver@reqres.in"} 
	
Scenario: TC04_Verifying the id field is not null 
	Given url 'https://reqres.in/api/users/2' 
	When method GET 
	Then status 200 
	And match response == {"data":{id:2, email:"janet.weaver@reqres.in", first_name:"Janet", last_name:"Weaver", avatar:"https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg"}} 
	And match response.data contains { id:"#notnull"} 
	
@negative 
Scenario: TC05_Testing an invalid GET endpoint - 404 
	Given url 'https://reqres.in/api/users/2786' 
	When method GET 
	Then status 404 
	
Scenario: TC06_Verifying the Request Line and Headers 

	Given header Accept-Encoding = 'gzip,deflate' 
	# And header Accept-Language= 'en-US,en'
	And header Host = 'restapi.demoqa.com' 
	#*def req_headers={Accept-Encoding: 'gzip,deflate',Accept-Language: 'en-US',Host = 'restapi.demoqa.com' }
	When url 'http://restapi.demoqa.com/utilities/weatherfull/city/cityName=city/india' 
	When method GET 
	Then status 200 
	
Scenario: TC07_Verifying the Response Status Line 
	Given 'https://restapi.demoqa.com/utilities/weatherfull/city/cityName=city/india' 
	When method GET 
	Then status 200 
	And match response == { City: "India",Temperature: "21.61 Degree celsius", Humidity: "72 Percent", WeatherDescription: "scattered clouds", WindSpeed: "2.65 Km per hour", WindDirectionDegree: "103.549 Degree" } 
	#And def contentType = responseHeaders['Content-Type'][0]
	#And match contentType contains Content-Type: application/json; charset=utf-8
	
	#Scenario: TC08_Verifying the Response Headers
	
	#Scenario: TC09_Verifying the Response Body
	#Given 'https://restapi.demoqa.com/utilities/weatherfull/city/cityName=city/india'
	#When method GET
	#Then status 200
	#And match response == { City: "India",Temperature: "21.61 Degree celsius", Humidity: "72 Percent", WeatherDescription: "scattered clouds", WindSpeed: "2.65 Km per hour", WindDirectionDegree: "103.549 Degree" }
	#And match response == '#[1]'
	#And match response[0].City== 'India'
	#And match each response == {City: "#string",Temperature: "21.61 Degree celsius", Humidity: "72 Percent", WeatherDescription: "#string", WindSpeed: "2.65 Km per hour", WindDirectionDegree: "103.549 Degree" }
	
@smoke 
Scenario: TC10_Verifying the single user from the group if list 
	Given url 'https://reqres.in/api/users?page=2' 
	When method GET 
	Then status 200 
	And match response == {"page":2,"per_page":3,"total":12,"total_pages":4,"data":[{"id":4,"email":"eve.holt@reqres.in","first_name":"Eve","last_name":"Holt","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/marcoramires/128.jpg"},{"id":5,"email":"charles.morris@reqres.in","first_name":"Charles","last_name":"Morris","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/stephenmoon/128.jpg"},{"id":6,"email":"tracey.ramos@reqres.in","first_name":"Tracey","last_name":"Ramos","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/bigmancho/128.jpg"}]} 
	And assert response.data.length == 3 
	And match response.data.[0].first_name == 'Eve' 
	
@retry 
Scenario: TC11_Verifying the Retry Until 
	Given url 'https://reqres.in/api/users?page=2' 
	When method GET 
	#And path 'greeting'
	And retry until response.id > 3 
	Then status 200
 function fn() {   
  var config = {
    apiURL: 'https://reqres.in/api/users'
  };
  
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}
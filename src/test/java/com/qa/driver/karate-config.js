function fn() {
	env = karate.env; // get java system property 'karate.env'
	karate.log('karate.env system property was:', env);

	var config = {
		apiURL : 'https://reqres.in/api/users'
	};
	if (env == 'stage') {
		// over-ride only those that need to be
		config.apiURL = 'https://reqres.in/api/users/2';
	} else if (env == 'e2e') {
		config.apiURL = ' ';
	}
	karate.configure('connectTimeout', 5000);
	karate.configure('readTimeout', 5000);
	return config;
}
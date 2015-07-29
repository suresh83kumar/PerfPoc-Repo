global class logindemo {
	
	webservice static string checklogin(string uname, string pwd)
	{
		if(uname == 'Training' && pwd == '12345')
		{
			return 'Successfully logged in.';
		}
		else {return 'Failed....';}
	
	}

}
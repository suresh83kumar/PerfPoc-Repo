global class servicedemo {
	
	webservice static string showinfo(string loc)
	{
		return userinfo.getFirstName()+' '+userinfo.getLastName() + ' ' + loc;
	}

}
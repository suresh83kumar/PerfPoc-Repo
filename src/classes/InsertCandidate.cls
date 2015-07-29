global class InsertCandidate {
	
	webservice static string getcandidateinfo(string fname, string lname, string city)
	{
		candidate__c c = new candidate__c();
		list<candidate__c> mycan = new List<candidate__c>();
		c.First_Name__c=fname;
		c.Last_Name__c=lname;
		c.City__c=city;
		
		//mycan.add(c);
		
		insert c;
		
		if (c.Id == null)
		{
			return 'Error occured during candidate creation';
		}
		else
		{
			return 'Successfully inserted candidate' + c.Id;
		}
		
		
		/*List<database.saveresult> sr = database.insert(mycan,false);
		
		for(database.saveresult srs:sr)
		{
				if (srs.isSuccess())
				{
					return 'Successfully inserted candidate';
				}
				else
				{
					return 'Error occured during candidate creation';
				}
		}*/
	}

}
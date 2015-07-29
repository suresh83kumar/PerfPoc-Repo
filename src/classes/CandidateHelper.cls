public with sharing class CandidateHelper {
	
	public static void checkemail(List<Candidate__c> c)
	{
		set<string> emailid = new set<string>();
		
		for(candidate__c cc : [select Email__c from candidate__c])
		{
			if(cc.email__c !=null)
			{
				emailid.add(cc.email__c);
			}
		}
		
		for(candidate__c aa : c)
		{
			if(emailid.contains(aa.email__c))
			{
				aa.email__c.addError('Email Already Exists. Please enter different email id');
			}
		}
	}

}
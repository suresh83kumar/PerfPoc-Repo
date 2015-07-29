@IsTest
public with sharing class OpportunityTriggerBulkTest {
	
	static TestMethod void testbulkStatusChange(){	
	//Insert Account
	Account a = new Account(Name = 'Test Account');
	insert a;
	user u = [select Id from user where Alias = 'SKuma'];
	
	//insert Opportunity
	List<sObject> LoadOpty = test.loaddata(Opportunity.sObjectType, 'LoadOpportunity');
	
	integer x = LoadOpty.size();
	List<Opportunity> finalList = new List<Opportunity>();
	
	for(integer j=0;j<x;j++){
		opportunity o = (Opportunity)LoadOpty[j];
		o.OrderNumber__c='333333';
		finalList.add(o);
	}
	
	//Run in user context
	system.runAs(u)
	{
	// introducing new governor limits for your specific unit test
	test.starttest();
	update finalList;
	test.stoptest();
	
	opportunity abc = [select id from opportunity limit 1];
	}
	
	}

}
@IsTest
public with sharing class OpportunityTriggerTest {
	
	static TestMethod void testApproved(){	
	
	//1) Prepare Test Data
	//--------------------
	Account a = new Account(Name = 'Test Account');
	insert a;
	user u = [select Id from user where Alias = 'SKuma'];
	
	//Run in user context
	system.runAs(u)
	{
	opportunity o = new opportunity (Name='Test Opty', CloseDate=system.today()+10,AccountId=a.Id,StageName='Prospecting',Type='New Customer',OrderNumber__c='12345',TrackingNumber__c='213');
	insert o;	
	
	//2) Execute unit test for your scenario
	//--------------------------------------
	
	// introducing new governor limits for your specific unit test
	test.starttest();
	o.Approval_Status__c = 'Approved';
	update o;
	test.stoptest();
	
	//3) Assert or Verify your unit test scenario
	//--------------------------------------------
	List<task> mytask = [select Id from task where WhatId =: o.Id];
	system.assert(mytask.size()>0);
	}
	
	}
	
	

}
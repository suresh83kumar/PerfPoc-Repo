/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class EmployeeHelper_Test {

    static testMethod void positivetest() 
    {
    	/*employee__c e1 = new employee__c(name='E1', salary__c=10000);
    	employee__c e2 = new employee__c(name='E2', salary__c=20000);
    	employee__c e3 = new employee__c(name='E3', salary__c=30000);*/
    	
    	List<sObject> objList = Test.Loaddata(Employee__c.sObjecttype,'edata');
    	
    	//list<employee__c> elist = new list<employee__c>{e1,e2,e3};
    	list<employee__c> elist = (List<employee__c>)objList;
    	database.insert(elist,false);
    	
    	map<id,employee__c> m = new map<id,employee__c>(elist);
    	
    	List<employee__c> ee = [select variable_pay__c from employee__c where id =: m.keyset()];
  test.starttest();  	
 try{
	for(employee__c x : ee)
    {
	system.assertequals(x.variable_pay__c,x.salary__c*0.3);	
	}    	
 }
 catch(system.exception e)
 {
 	system.debug('something is wrong.....'+e.getmessage());
 }
 test.stoptest();
}
}
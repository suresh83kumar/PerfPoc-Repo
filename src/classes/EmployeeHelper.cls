public with sharing class EmployeeHelper {
	
	public static void calcvp(List<Employee__c> e)
	{
		for(employee__c ee : e)
		{
			ee.variable_pay__c = ee.salary__c*0.3;
		}
	}

}
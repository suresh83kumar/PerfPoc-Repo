trigger EmployeeTrigger on Employee__c (before insert, before update) {
	
	if(trigger.isinsert && trigger.isbefore)
	{
		EmployeeHelper.calcvp(trigger.new);
	}

}
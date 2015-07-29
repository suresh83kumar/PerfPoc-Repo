trigger TriggerOpportunity on Opportunity (after insert, after update) {
	
	if(trigger.isInsert)
	{
		
	//Below FOR loop executes 40 SOQL Query.
		for(integer i=0; i<40;i++)
		{
			opportunity o = [select id from opportunity limit 1];
		}
	}
	
	//write test class for below code
	
	if(trigger.isUpdate && trigger.isAfter)
	{
		OpportunityHelper.notifyOMS(trigger.new);
	}
}
global class positionBatch implements database.batchable<sObject>, database.stateful {
	
	Integer rCount = 0;
	
	global database.querylocator start(database.batchablecontext bc)
	{
		database.querylocator qc = database.getQuerylocator('select name,min_pay__c, max_pay__c from position__c');
		
		return qc;
	}
	
	global void execute(database.batchablecontext bc, List<sObject> olist)
	{
		
		for(sObject s : olist)
		{
			position__c p = (position__c)s;
			
			if (p.min_pay__c == null)
			{
				p.min_pay__c = 1000;
				rCount = rCount+1;
			}
			if (p.max_pay__c == null)
			{
				p.max_pay__c = 5000;
			}
			upsert p;
			system.debug('Position ' + p.name + 'processed in batch class');
		}
		
	}
	
	global void finish(database.batchablecontext bc)
	{
		system.debug('No of records updated : ' + rCount);
	}

}
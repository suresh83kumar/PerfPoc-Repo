public with sharing class PositionHelper {
	
	public void checkRecord(position__c p)
	{
		if (p.min_pay__c > p.max_pay__c){
			
			throw new PositionException();
		}else
		system.debug('----------------Record Validated');
	}

	public static void checkpay(List<position__c> ndata, Map<Id, Position__c> odata)
	{
		for(position__c p: ndata)
		{
			if(p.min_pay__c < odata.get(p.id).min_pay__c)
			{
				p.min_pay__c.addError('You are not allowed to enter lesser value than current one-->Min Pay');
			}
			
			if(p.max_pay__c < odata.get(p.id).max_pay__c)
			{
				p.max_pay__c.addError('You are not allowed to enter lesser value than current one -->Max Pay');
			}
		}
		
	}


}
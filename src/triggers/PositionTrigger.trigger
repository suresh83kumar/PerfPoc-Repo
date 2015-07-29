trigger PositionTrigger on Position__c (after delete, after insert, after undelete, 
after update, before delete, before insert, before update) {
	
	if(trigger.isbefore && trigger.isupdate)
	{
		PositionHelper.checkpay(trigger.new,trigger.oldMap);
	}

}
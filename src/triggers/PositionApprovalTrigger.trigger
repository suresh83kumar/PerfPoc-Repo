trigger PositionApprovalTrigger on Position__c (before insert, before update) {
	
	PositionApproval.setPositionApprovers(trigger.new);

}
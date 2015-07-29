trigger AccTrigger on Account (after delete, after insert, after undelete, 
after update, before delete, before insert, before update) {
  
  for (Account c: trigger.new){  
   if(trigger.isupdate && trigger.isbefore)
    {
        //CandidateHelper.checkemail(trigger.new);
        Opportunity__c myset = Opportunity__c.getInstance(UserInfo.getUserId());
        boolean mflag = myset.Bypass__c;
        
        If (mflag)
        {
        c.addError('Your flag is true');
        }
        else
        {
        c.addError('Your flag is false');
        }
    }
  }
}
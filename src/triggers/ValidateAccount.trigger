trigger ValidateAccount on Account (before delete) {
map<Account, Id> acc = new map<Account, Id> ();
    for (Opportunity o : [select AccountId from opportunity where AccountId in : Trigger.oldmap.keyset()])
    {
        Account a = trigger.oldmap.get(o.AccountId);
        a.addError('Opportunity is available for your account');
    }      
}
@isTest
private class EmployeeHelper_Test123 {

    static testMethod void positivetest() 
    {
        employee__c e1 = new employee__c(name='E1', salary__c=10000);
        employee__c e2 = new employee__c(name='E2', salary__c=20000);
        employee__c e3 = new employee__c(name='E3', salary__c=30000);
        
        list<employee__c> elist = new list<employee__c>{e1,e2,e3};
        
        database.insert(elist,false);
        
        map<id,employee__c> m = new map<id,employee__c>(elist);
        
        List<employee__c> ee = [select variable_pay__c from employee__c where id =: m.keyset()];
        
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
}
}
public with sharing class wizardextension {

    
    private Apexpages.StandardController ctr;
    candidate__c c;
    Public wizardextension(ApexPages.StandardController controller) {
        this.ctr=controller;
        c=(candidate__c)ctr.getRecord();
    }
    public pageReference showNext()
    
        {
            if (c.first_name__c == null || c.last_name__c == null || c.email__c==null)
            {
            Apexpages.Message er = new Apexpages.Message(ApexPages.Severity.ERROR, 'Hey....Enter all the field values');  
            Apexpages.addMessage(er);
            return null;
            }
            else
            {
                pageReference pr = new pageReference('/apex/wizardpage1');
                pr.getParameters().put('FNAME',c.first_name__c);
                pr.getParameters().put('LNAME',c.last_name__c);
                pr.getParameters().put('EMAIL',c.email__c);
                pr.setRedirect(true);
                return pr;
            }
        }
        
        public pageReference insertC()
        {
        if (c.city__c == null || c.state_province__c == null)
            {
            Apexpages.Message er = new Apexpages.Message(ApexPages.Severity.ERROR, 'Hey....Enter all the field values');  
            Apexpages.addMessage(er);
            return null;
            }
            else
            {
            candidate__c c1= new candidate__c();
            c1.first_name__c = ApexPages.Currentpage().getParameters().get('FNAME');
            c1.last_name__c = ApexPages.Currentpage().getParameters().get('LNAME');
            c1.email__c = ApexPages.Currentpage().getParameters().get('EMAIL');
            c1.city__c=c.city__c;
            c1.state_province__c=c.state_province__c;
            
            database.insert(c1);
            pageReference pr1 = new pageReference('/'+c1.Id);
            return pr1;
          }
        }

}
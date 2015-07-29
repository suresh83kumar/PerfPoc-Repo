public class positionextension {

    private Apexpages.standardcontroller ctr;
    position__c p;
    public double hra {get; set;}
    public double ta {get; set;}
    public double gross {get; set;}
    
    public positionextension(ApexPages.StandardController controller) {
     this.ctr=controller;
     p=(position__c)ctr.getRecord();

    }

    public void mypage()
    {
        double avgpay = (p.max_pay__c-p.min_pay__c)/2;
        hra = avgpay*0.3;
        ta=avgpay*0.15;
        gross=avgpay+hra+ta;
        //return ctr.view().setRedirect(true);
    }

}
public class beforeOpty{

static{

util.myflag=false;

}

public void beforeOpty1(List<Opportunity> c){



for(opportunity cc:c){

//a=cc.CurrentGenerators__c;

if(cc.Parent_Opportunity__c!=null){

system.debug('----------Your util class value-----------'+util.myflag);

opportunity cand = [select CurrentGenerators__c from opportunity where Id =: cc.Parent_Opportunity__c limit 1];

cand.CurrentGenerators__c=cand.CurrentGenerators__c+'hello';

update cand;

}

}
}

/*public static upParent1(List<Opportunity> c){

system.debug('----------Your before static value-----------'+a);

for(opportunity cc:c){

if(cc.Parent_Opportunity__c!=null){

opportunity cand = [select CurrentGenerators__c from opportunity where Id =: cc.Parent_Opportunity__c limit 1];

cand.CurrentGenerators__c=cand.CurrentGenerators__c+'hello';

update cand;

}

}

}*/


}
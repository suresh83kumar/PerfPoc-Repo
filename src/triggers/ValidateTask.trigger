trigger ValidateTask on Opportunity (before insert, after insert, before update) {
    
/*system.debug('my map:'+trigger.oldmap.keyset());
    for (task t : [select whatId from task where whatid in : Trigger.oldmap.keyset()])
    {
        system.debug('what is task id' + t.whatid);
        opportunity o = trigger.oldmap.get(t.whatid);
        string oid = o.Id;
        system.debug('my opty' + o);
        o.addError('Opportunity is available for your account');
    }    */
List<opportunity> myopp = new List<opportunity>(trigger.new);
List<opportunity> myopp1 = new List<opportunity>();

myopp1.addAll(myopp);

for(opportunity o: myopp1){
system.debug('-----copied opp first------'+o.TrackingNumber__c);
}

if(trigger.isbefore && trigger.isupdate){
beforeupdateopty bou = new beforeupdateopty();

bou.mainclass1(myopp);

for(opportunity o: myopp1){
system.debug('-----copied opp second------'+o.TrackingNumber__c);
//o.TrackingNumber__c='';
}

}

}

//system.debug('after insert--------'+util.myflag);
  //  beforeOpty up = new beforeOpty();
  //  up.beforeOpty1(trigger.new);
    //system.debug('before update--------'+util.myflag);
  //  if(util.myflag){
  //    util.myflag=false;
    //}
    //} 

//}
/*system.debug('before insert--------'+util.myflag);
    beforeOpty up = new beforeOpty();
    
    system.debug('before update123--------'+util.myflag);
    if(util.myflag){
      util.myflag=false;
     
    }
    up.beforeOpty1(trigger.new);
    } 
    
if(trigger.isupdate && trigger.isbefore){
system.debug('before update--------'+util.myflag);
    //beforeOpty up = new beforeOpty();
    //up.beforeOpty1(trigger.new);
    //system.debug('before update--------'+util.myflag);
    if(util.myflag){
    // util.myflag=false;
    }
    }  
    
if(trigger.isupdate && trigger.isafter){
  system.debug('after update --------'+util.myflag);
   // updateParent up = new updateParent();
   // up.upParent(trigger.new, true);
    }  */
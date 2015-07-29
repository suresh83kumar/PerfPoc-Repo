trigger TriggerAccount on Account (after insert) {

  //Account insert trigger calls 110 SOQL Query
  
    for(integer i=0;i<50;i++)
    {
        account a=[select Id from account limit 1];
    }

}
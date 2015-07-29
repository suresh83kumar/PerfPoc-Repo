public class class2{

public void update1(List<opportunity> o1){

for(opportunity o: o1){
o.TrackingNumber__c= '1111';

system.debug('--------context verification--------'+o.OrderNumber__c);
}


}


}
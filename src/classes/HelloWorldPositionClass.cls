public class HelloWorldPositionClass {
    
    public static void helloWorld(List<Position__c> positions){
        
        for (Position__c p:positions){
        	//p.Avg_Pay__c = (p.Max_Pay__c-p.Min_Pay__c)/2;
            if (p.Hello__c != 'World') {
                p.Hello__c = 'World'; 
            }
        }
    }
}
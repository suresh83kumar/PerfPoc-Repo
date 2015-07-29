public class sobjectpage {

        public string country {get; set;}
            
        public PageReference test() {
            return null;
        }
            
        public List<SelectOption> getObjects() {
            List<SelectOption> options = new List<SelectOption>();
          
               List<objectName__c> o = objectName__c.getall().values();
                   for (objectName__c obj : o)
                   {
                       options.add(new SelectOption(obj.Name,obj.Name));
                   }
           
            return options;
        }


}
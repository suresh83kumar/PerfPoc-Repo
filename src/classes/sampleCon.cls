public class sampleCon {

    public List<wrapperclass> getMylist() {
        return Mylist;
    }


        public string country {get; set;}
        public string child {get; set;}
        public string mytest{get; set;}
        public boolean checked {get; set;}
        public List<wrapperclass> wrap {get; set;}
        public List<wrapperclass> selwrap {get; set;}
        List<contact> cc {get; set;}
        public string obj = 'Contact';

        public sampleCon () {}
        
        
       public Apexpages.StandardSetController setCon {
            get{
            if (setCon == null){
            if(country == null){
            obj = 'Contact';}else {obj = country;}
            String MyQuery = 'Select Id, Name from ' + string.escapesinglequotes(obj) + '';
            system.debug('iiiiiiii'+MyQuery);
            setCon = new Apexpages.standardsetcontroller(Database.getQueryLocator(MyQuery));
            system.debug('UUUUUUUU'+setCon);
            setCon.setPagesize(5);
                 }
            return setCon;
        } 
            set;
        }
        
        public List<wrapperclass> getWrapper() {
        
            if(setCon !=null){
            List<contact> cc1 = new List<contact> ((List<contact>)setCon.getRecords());
            //List<contact> cc = new List<contact> ([select Id, Name from Contact]);
            wrap = new List<wrapperclass>();
            for(contact c : cc1)
                 {
                   
                   system.debug('!!!!!!!!!!!'+c);
                   wrap.add(new wrapperclass(c));  
                   system.debug('^^^^^^^^^^'+wrap);
                 }                
            }
            system.debug('%%%%%%%%%%'+wrap);
            return wrap;
         }    
         
         public List<wrapperclass> getWrappersel() {
        
            
            
            if(setCon !=null){
            List<contact> cc2 = new List<contact> ((List<contact>)setCon.getRecords());
            system.debug('hahahahahahaha' + wrap);
            //List<contact> cc = new List<contact> ([select Id, Name from Contact]);
            selwrap = new List<wrapperclass>();
            for(contact c : cc2)
                 {
                   
                   system.debug('!!!!!!!!!!!'+c);
                   selwrap.add(new wrapperclass(c));  
                   system.debug('^^^^^^^^^^'+selwrap);
                 }                
            }
            system.debug('%%%%%%%%%%'+selwrap);
            return selwrap;
         }
        
         
        public class wrapperclass {
            public boolean checked {get; set;}
            public contact con {get; set;}
           
           public wrapperclass(contact c) {
           con = c;
           checked = false;  
           system.debug('@@@@@@@@@@'+c);         
           }
        }
               
        public List<SelectOption> getItems() {
            List<SelectOption> options = new List<SelectOption>();
          
               List<objectName__c> o = objectName__c.getall().values();
                   for (objectName__c obj : o)
                   {
                       options.add(new SelectOption(obj.Name,obj.Name));
                   }
           
            return options;
        }
        
        public List<SelectOption> getChildss() {
            List<SelectOption> options1 = new List<SelectOption>();
            system.debug('Entered Child one');
               Map<String, Cobject__c> c = Cobject__c.getall();
               Map<String, Cobject__c>  str = new Map<String, Cobject__c>();
               For(Cobject__c Child : c.values()){
               system.debug('Entered Child two');
                  If(Child.Object_Name__c == this.country){
                     str.put(Child.Child_Name__c, Child); 
                     system.debug('Entered Child three' + str);
                  }
               
               }
                   for (Cobject__c obj : str.values())
                   {
                   system.debug('Entered Child four');
                       options1.add(new SelectOption(obj.Child_Name__c,obj.Child_Name__c));
                   }
                   //options1.add(new SelectOption('', '--Select One--'));
            system.debug('*******************' + options1);
            return options1;
        } 
        
        public List<SelectOption> getChildchild() {
            List<SelectOption> options2 = new List<SelectOption>();
            system.debug('Entered dChild one');
               Map<String, CCobject__c> d = CCobject__c.getall();
               Map<String, CCobject__c>  stri = new Map<String, CCobject__c>();
               For(CCobject__c cChild : d.values()){
               system.debug('Entered dChild two');
                  If(cChild.Child_Name__c == this.Childs){
                     stri.put(cChild.Child_Child_Name__c, cChild); 
                     system.debug('Entered dChild three' + stri);
                  }
               
               }
                   for (CCobject__c obje : stri.values())
                   {
                   system.debug('Entered dChild four');
                       options2.add(new SelectOption(obje.Child_Child_Name__c,obje.Child_Child_Name__c));
                   }
                   options2.add(new SelectOption('', '--Select One--'));
            system.debug('------------' + options2);
            return options2;
        }         
     
        
        public void First (){
        setCon.First();
        }
        
        public void Last(){
        setCon.Last();
        }
        
        public void next(){
        setCon.next();
        }
        
        public void Previous (){
        setCon.Previous();
        }        

        public PageReference test() {
        return null;
        }
        
        public PageReference refresh() {
        return null;
        }
        
        public List<wrapperclass> Mylist = new List<wrapperclass>(); 
        public set<String> mySet = new set<String>();
        
        public PageReference customsave(){
            system.debug('hehehehehe'+wrap);
            for (wrapperclass wc : wrap){
                if (wc.checked){
                    if(!myset.contains(wc.con.Id)){
                    mySet.add(wc.con.Id);
                    system.debug('ohohohohoh'+wc.con.Name);
                    Mylist.add(wc);
                    //ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,wc.con.Name));
                }
                }
            }
        return null;
        }
        
        private string Test = 'ha';
        
        public void setTest(string n){
        Test = n;
        }
        
        public string getTest(){
        return Test;
        }
        
        public PageReference fire() {
        //Test = 'hahaha';
        return null;
        }
        
        public string Childs;
        public void setChilds(string c){
        Childs = c;
        }
        
        public string getChilds(){
        return Childs;
        }
        
        public string cChilds;
        public void setcChilds(string c){
        cChilds = c;
        }
        
        public string getcChilds(){
        return cChilds;
        }
        
        public string ccChilds;
        public void setccChilds(string d){
        ccChilds = d;
        }
        
        public string getccChilds(){
        return ccChilds;
        }

    }
public class MyobjectPage {

public string country {get; set;}
public string child {get; set;}
public string mytest{get; set;}
public boolean checked {get; set;}
public List<wrapperclass> wrap {get; set;}
public List<wrapperclass> selwrap {get; set;}
List<contact> cc {get; set;}
public string obj = 'Contact';
        
 public Apexpages.StandardSetController setCon {
            get{
            if (setCon == null){
            string obj;
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
        
        public PageReference refresh() {
        return null;
        }
        
        
        public List<wrapperclass> Mylist = new List<wrapperclass>(); 
        public set<String> mySet = new set<String>();
         public List<wrapperclass> getMylist() {
         return Mylist;
         }
        
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

}
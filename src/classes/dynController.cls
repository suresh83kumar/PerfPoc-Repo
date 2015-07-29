public class dynController {

public List<Schema.SobjectType> ObjList {get; set;}
public list<string> fldList {get; set;}
public list<string> fldList1 {get; set;}
public string objname{get; set;}
public string selObj {get; set;}


    public void showObjects()
    {
    Map<String,Schema.SobjectType> myMap = Schema.getGlobaldescribe();
    objList = new List<Schema.SobjectType>(myMap.values());
    }
    

    public pageReference onClick1()
     {
      /* selObj = ApexPages.currentPage().getParameters().get('objId'); 
       system.debug('-------------------------'+selObj);    
       Map<String, Schema.sObjectType> fldMap1 = Schema.getGlobaldescribe();
       Schema.DescribesObjectResult dor1 = fldMap1.get(selObj ).getDescribe();
       Map<String,schema.sobjectfield> myfield1 = dor1.fields.getMap();
       fldList1 = new List<String> (myfield1.keyset());*/
       return null;      
     }
        
     public void showFields()
      {
      /* Map<String, Schema.sObjectType> fldMap = Schema.getGlobaldescribe();
       Schema.DescribesObjectResult dor = fldMap.get(objname).getDescribe();
       Map<String,schema.sobjectfield> myfield = dor.fields.getMap();
       fldList = new List<String> (myfield.keyset());*/
      } 

}
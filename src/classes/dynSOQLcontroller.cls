public class dynSOQLcontroller {

public string objName {get; set;}
public string fldName {get; set;}
public list<sObject> slist {get; set;}
public list<string> rlist {get; set;}
public string batchMsg {get; set;}

    public void runQuery(){
    	system.debug('select '+fldName+ 'from ' + objName);
        slist = database.query('select '+fldName+ ' from ' + objName);
        if (slist.size() > 0)
        {
         string[] f = fldName.split(',');
         List<string> flist = new List<string>();
         flist = f;
         rlist = new list<string>();
         for(sObject s : slist)
          {
             string rec='';
             for(integer i=0; i<flist.size();i++)
              {
               rec = rec + ' ' + s.get(flist.get(i));
              }
              rlist.add(rec);
          }
        }
    }
    
    public void cleanPos()
    {
        positionBatch pb = new positionBatch();
        database.executeBatch(pb,100);
        batchMsg = 'Batch Started.....check Log';
    } 

}
public class dynamicQuestions {

public string str {get; set;}
public List<String> s { get; set; }
public static List<String> selected = new List<String>();
public Map<Id,Export_Compliance__c> m = new Map<Id,Export_Compliance__c>();
public Map<String, rWrapper> rWrap {get; set;}
Map<Id, List<Question_Response__c>> final1 = new Map<Id, List<Question_Response__c>>();
Map<Id, Question_Response__c> rType = new Map<Id, Question_Response__c>();
List<Question_Response__c> Ques = new List<Question_Response__c>();
public Map<Id, rWrapper> fWrapper {
	get; 
	set{
		fWrapper = value;
		system.debug('setter method'+fWrapper);
	}
	
	}
Map<Id, List<String>> strList {get; set;}
public Map<Id, List<String>> z { get; set; }
public string myval {get; set;}

public class rWrapper {
public string sflag {get; set;}
public List<String> lstr {get; set;}
public List<Question_Response__c> QRlist {get; set;}
//public List<String> multipleAnswer {get; set;}

public rWrapper(string a,List<String> b, List<Question_Response__c> c){
this.sflag =a;
this.lstr = b;
this.QRlist =c;
//this.multipleAnswer = new List<String>();
}
}

public dynamicQuestions(){
z = new Map<Id, List<String>> ();
List<Export_Compliance__c> os = new List<Export_Compliance__c>([select Id, name, Parent__c,Response_Type__c,Opportunity__c, Question_Id__c from Export_Compliance__c]);
Ques = [select Id, name, Response_Type__c, Question__c, Parent_Question_Id__c, Response__c from Question_Response__c];
s = new List<string>();
fWrapper = new Map<Id, rWrapper>();
rWrap = new Map<String, rWrapper>();
strList = new Map<Id, List<String>>();
system.debug('frwapper within constructor :' + fWrapper);
for(Export_Compliance__c e : os)
{

    if(e.Response_Type__c=='Radio')
    {
        rWrap.put(e.Parent__c, new rWrapper(''+e.Question_Id__c+'', new List<String>(), new List<Question_Response__c>()));
        system.debug('------rWrap---------'+rWrap + ' Parent Q is -->: '+e.Parent__c);
    }
    if(e.Response_Type__c=='Multi')
    {    
        List<string> tempList = new List<string>();
        if(strList.get(e.Parent__c) !=null)
        {
            tempList = strList.get(e.Parent__c);
        } 
        tempList.add(e.Question_Id__c);
        strList.put(e.Parent__c,tempList);
        s.add(e.Question_Id__c);
    }
    
m.put(e.Question_Id__c,e);
}


   for(Question_Response__c qq : Ques)
    {
    
    //Stores Master Question's response
        if(qq.Parent_Question_Id__c == null)
        {
            rType.put(qq.Id, qq);
        }
    
    //Forms a map with master question and its list of responses.  
        if(qq.Parent_Question_Id__c!= null)
        {
            //rWrapper w = new rWrapper();
            string tempa='';
            List<String> tempb;
            List<Question_Response__c> a = new List<Question_Response__c>();
            //If statement to set list of responses
            if(fWrapper.get(qq.Parent_Question_Id__c)==null)
            {
                a.add(qq);               
            } else {
                a=fWrapper.get(qq.Parent_Question_Id__c).QRlist;
                a.add(qq);
            }
            //If statement to set list of checkboxes selection
           if(strList.get(qq.Parent_Question_Id__c) == null){
               tempb = new List<string>();             
            } else {
               tempb = strList.get(qq.Parent_Question_Id__c);
            }
            //If statement to string of radio selection            
           if(rWrap.get(qq.Parent_Question_Id__c)!=null){
            tempa = rWrap.get(qq.Parent_Question_Id__c).sflag;
            }
            
            fWrapper.put(qq.Parent_Question_Id__c, new rWrapper(tempa,tempb,a));
            
system.debug('your fWrapper------------'+fWrapper);    
        }
    }
}

public Component.Apex.PageBlock getRadio(){

component.apex.pageblock pb = new component.apex.pageblock();
Component.Apex.PageBlockButtons pbb = new Component.Apex.PageBlockButtons();
Component.Apex.CommandButton cb = new Component.Apex.CommandButton();
cb.expressions.action='{!createRecords}';
cb.value='Save';
pbb.childcomponents.add(cb);
pb.childcomponents.add(pbb);
component.apex.OutputPanel op = new component.apex.OutputPanel();
op.id = 'outPanel';
//system.debug('************* ' +awrap);
for(Id myQR : fWrapper.keyset()){
component.apex.outputlabel myRlabel = new component.apex.outputlabel();
component.apex.outputText ot = new component.apex.outputText();
ot.value = rType.get(myQR).Question__c;
myRlabel.childcomponents.add(ot);

if(rType.get(myQR).Response_Type__c == 'Radio'){
myRlabel.childcomponents.add(sr(fWrapper.get(myQR).QRlist,myQR,fWrapper.get(myQR).sflag));
op.childcomponents.add(myRlabel);
}

if(rType.get(myQR).Response_Type__c == 'Multi'){
myRlabel.childcomponents.add(sc(fWrapper.get(myQR).QRlist, myQR, fWrapper.get(myQR)));
op.childcomponents.add(myRlabel);
}


}
pb.childcomponents.add(op);
return pb;
}
//pass wrapper as input to this method and use that in expressions????give a try
public component.apex.selectRadio sr(List<Question_Response__c> myR, String pId, String aaa){
component.apex.selectRadio ssr = new component.apex.selectradio(Id=pId, layout='pageDirection',value=fWrapper.get(pId).sflag);
for(Question_Response__c childq : myR)
{
        if(m.ContainsKey(childq.Id))
        {
            ssr.expressions.value='{!'+fWrapper.get(pId).sflag+'}';
        }
    component.apex.selectoption so = new component.apex.selectoption();
    so.itemvalue = childq.Id;
    so.itemlabel = childq.Response__c;
    ssr.childcomponents.add(so);
}
return ssr;
}

public component.apex.SelectCheckboxes sc(List<Question_Response__c> myR, String pId, rWrapper xyz){
system.debug(';;;;;;;;;;;;;'+xyz);
component.apex.SelectCheckboxes ssc = new component.apex.SelectCheckboxes(Id=pId, Layout='pageDirection', value = fWrapper.get(pId).lstr);
//ssc.expressions.value = '{!'+fWrapper.get(pId).lstr+'}';
for(Question_Response__c childq : myR)
{
    component.apex.selectoption so = new component.apex.selectoption();
    so.itemvalue = childq.Id;
    so.itemlabel = childq.Response__c;
    ssc.childcomponents.add(so);
}
return ssc;
}


public pageReference createRecords(){

system.debug('fwrapper : '+fWrapper);

return null;

}


}
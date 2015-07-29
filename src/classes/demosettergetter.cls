public class demosettergetter {

public string banner {
get
{
    string empbanner = 'Apex Controllers';
    return empbanner;
}
}

public List<Position__c> plist{
get
{
List<position__c> pdata = [select name,department__c from position__c limit 10];
return pdata;
}

}
public string err {get; set;}
public string ename
{
get;
set 
{
    If(ename==null){err = 'Field is null. Please enter a value';}
}
}

public pageReference disp()
{
return null;
}

}
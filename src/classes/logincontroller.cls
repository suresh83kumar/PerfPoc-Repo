public with sharing class logincontroller {
    
    public string uname {get; set;}
    public string pwd {get; set;}
    
    public string logresponse {get; set;}
    
    public void loguser()
    {
        loginservice.logindemo stub = new loginservice.logindemo();
        partnerSoapSforceCom.Soap sp = new partnerSoapSforceCom.Soap(); //class use to authorize
        partnerSoapSforceCom.LoginResult lr = sp.login('admin@dev501.30186.com.dev','Mycrm12345');
        loginservice.SessionHeader_element se = new loginservice.SessionHeader_element();
        se.sessionId = lr.sessionid;
        stub.SessionHeader=se;
        
        try
        {
        logresponse = stub.checklogin(uname,pwd);
        }
        
        catch(system.calloutexception ce){
            logresponse = ce.getMessage();
        }
    }

}
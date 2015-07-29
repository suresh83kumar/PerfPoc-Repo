@RestResource(urlMapping='/AccTest/*')
Global class MyAccountRest{

@HttpGet
    Global static Account abc(){
    	RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        string accId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account acc = [select Id,Name,BillingCity,Phone from Account where Id =: accId];
     	return acc;   
	}


}
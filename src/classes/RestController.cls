public with sharing class RestController {
	
	public string msg {get; set;}
	
	public void show()
	{
		Http h = new Http();
		HttpRequest hr = new HttpRequest();
		hr.setMethod('GET');
		hr.setendpoint('https://cs17.salesforce.com/services/apexrest/maskingRest');
		hr.setHeader('Authorization','Bearer '+UserInfo.getSessionId());
		
		httpresponse hrs = h.send(hr);
		
		msg = hrs.getBody();
	}	
	
}
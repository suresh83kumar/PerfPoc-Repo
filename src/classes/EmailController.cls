public with sharing class EmailController {
	
	public string toaddr {get; set;}
	public string ebody {get; set;}
	public string emsg {get; set;}
	
	public void testemail()
	{
		Messaging.singleemailmessage sm = new messaging.singleemailmessage();
		sm.settoaddresses(new List<string> {toaddr});
		sm.setplaintextbody(ebody);
		List<messaging.sendemailresult> er = Messaging.sendemail(new List<messaging.singleemailmessage> {sm});
		
		for(messaging.sendemailresult sr : er)
		{
			if(sr.isSuccess())
			{
				emsg='Email Successfully Processed';
			}
			else
			{
				messaging.sendemailerror errr=sr.getErrors()[0];
				emsg = errr.getMessage();
			}
		}
	}

}
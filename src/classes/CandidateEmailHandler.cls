/**
 * Email services are automated processes that use Apex classes
 * to process the contents, headers, and attachments of inbound
 * email.
 */
global class CandidateEmailHandler implements Messaging.InboundEmailHandler {

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
        
        string emailBody = EncodingUtil.urlDecode(email.plaintextbody,'UTL-8');

		string[] cData = emailBody.split(',');
		
		candidate__c c = new candidate__c();
		c.first_name__c = cData[0];
		c.last_name__c = cData[1];
		c.email__c = cData[2];
		c.city__c = cData[3];
		
		try{
			
			database.insert(c);
			result.success=true;
			system.debug('inserted candidate'+c.Id);
		}
		
		catch(system.dmlexception e)
		{
			system.debug ('Failed to load candidate via email :' + e.getMessage());
			result.success=false;
		}
        return result;
    }
}
public class PositionNewEditOverrideExtension{
    
    // TODO: Declare a private variable of type Position__c called "pos".
	private position__c pos;
	private boolean bUpdate;
    
    // TODO: Declare a private Boolean variable called "bUpdate"
    //       to track if this is an insert or an update.

    // StandardController "controller" for later use in action methods.
    private ApexPages.StandardController controller;

    // String property to hold a message value
    public String myMessage { get; set; }
	
	public PositionNewEditOverrideExtension(ApexPages.StandardController controller){
	
	this.pos = (position__c)controller.getRecord();
	Id posId = ApexPages.currentpage().getParameters().get('Id');
	
	if (posId==null){
	bUpdate=false;}
	else {
	bUpdate=true;}
	
	}

    public PageReference SayHelloWorld(){
        // call this custom function from your visualforce page
        myMessage = 'Hello World!';

        // We're not redirecting the user to a different page so we just say return null
        return null;
    }
    
	public pageReference mySave(){
	
	if(bUpdate){
	update pos;
	} else {
	insert pos;
	}
	string partialURL = '/'+pos.Id;
	pageReference pf = new PageReference(partialURL);
	return pf;
	}

   
}
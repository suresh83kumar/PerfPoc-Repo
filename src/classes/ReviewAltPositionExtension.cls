public class ReviewAltPositionExtension{
	
    // TODO: Create a public property called "review" for a single 
    //       Review__c sObject with default getters and setters
	public Review__c review {get; set;}

    private Job_Application__c jobApplication { get; set; }

		// TODO: Create a private property named "controller" of type 
		// 			 StandardController which will be used later to reference
		//	     the instance of the StandardController passed to the constructor
	private ApexPages.StandardController controller;
    
    public Boolean bUpdate { get; set; } // a flag so we know if this is an insert or update
    
    // TODO: Create a public String property "candidateId". 
    //       Override the getter. If null (on the first access), 
    //       use SOQL to fetch the candidate Id from the Review__c sObject
    //       (through the related job application), using the id of "review".
    // 	     Use the default setter.
	public string candidateId {
	get{
	if(candidateId==null){
		if(bUpdate){
		//candidateId = [select Job_Application__r.Candidate__c from  Review__c where Id: IN ApexPages.currentpage().getParameters('Id') limit 1].Job_Application__r.Candidate__c;
		candidateId = [	SELECT job_application__r.candidate__c 
    												FROM review__c
    												WHERE id=:review.id].job_application__r.candidate__c;
		
		}
		
	}
	return candidateId;
	}
	set;
	
	}
	
    public String positionId { get; set; }
    
		// TODO: Create a public Boolean property called "showAltPosition".
		//       Override the getter. If null, initialize it to false.
		//       Use the default setter.
		
	public boolean showAltPosition {
	get
	{
	If(showAltPosition==null) {
		return false;
	} else {
		return true;
	}
	}
	set;
	}

    public String recruiterNote { get; set; }
    
    public Task recruiterTask {
    	get{
    		if (recruiterTask == null){
    			Task t = new Task();
    			t.Subject = 'New Job App: Alt Position Suggested';
        		t.ActivityDate = System.today() + 3;
        		t.IsReminderSet = true;
        		t.ReminderDateTime = System.now()+1;
       			t.Status = 'Not Started';
        		t.Priority = 'Normal';
    			recruiterTask = t;
    		}
    		return recruiterTask;
    	}
    	set;
    }
    
    // TODO: Create a property for a private list of Position__c sObjects 
    //       called "positions". 
    //       Override the default getter. Using SOQL, retrieve all fields from
    //       the Position__c sObject table where department__c is equal to the
    //       "selectedDept", status__c is 'Open', and sub_status__c is 'Approved".
    //       Use the default setter.
    // HINT: Use the Schema Browser in the Force.com IDE to quickly construct a  
    //       SOQL query that will return all fields.

		// TODO: Create a public String property called "SelectedDept" that
		//       uses the default getter and setter.
    
		// TODO: Create a public String property called "SelectedPositionId" that
		//       uses the default getter and setter.
		
	private List<position__c> positions {
	get{
	return [Select p.Type__c, p.SystemModstamp, p.Sub_Status__c, p.Status__c, p.Start_Date__c, p.Skills_Required__c, p.Responsibilities__c, p.RecordTypeId, p.Programming_Languages__c, p.Priority__c, p.Pay_Grade__c, p.OwnerId, p.Operating_Systems__c, p.Number_of_Positions__c, p.Number_of_Interviewers__c, p.Name, p.Min_Pay__c, p.Max_Pay__c, p.Location__c, p.Legacy_Position_Number__c, p.LastViewedDate, p.LastReferencedDate, p.LastModifiedDate, p.LastModifiedById, p.LastActivityDate, p.Job_Description__c, p.IsDeleted, p.Id, p.Hiring_Manager__c, p.Hello__c, p.Education__c, p.Duration__c, p.Department__c, p.Days_Opened__c, p.Date_Opened__c, p.Date_Closed__c, p.CreatedDate, p.CreatedById, p.ConnectionSentId, p.ConnectionReceivedId, p.Avg_Pay__c, p.Approver_3__c, p.Approver_2__c, p.Approver_1__c From Position__c p WHERE department__c = :SelectedDept];
	}
	set;
	}
	
	public string SelectedDept {get; set;}
	public string SelectedPositionId {get; set;}
		
    public Position__c SelectedPosition {
        get{
            // make sure we have the latest position by checking the SelectedPositionId from the selectList
            if ((SelectedPositionId != 'null') && (SelectedPositionId != null)){
	            if ((SelectedPosition == null)||(SelectedPosition.id != SelectedPositionId)) {
	            	//get the Position record that corresponds to the SelectOption position Id chosen
	            	Map<ID,Position__c> positionsMap = new Map<ID,Position__c>(positions);
	                SelectedPosition = positionsMap.get(SelectedPositionId);
	            }
            } else {
		    SelectedPosition = new Position__c();
	    }
            return SelectedPosition;
        }
        set;
    }
    
    public reviewAltPositionExtension(ApexPages.StandardController stdController) {
    	// constructor
    	controller = stdController;
        this.review= (Review__c)stdController.getRecord();
        if ((ApexPages.currentPage().getParameters().get('jobAppId') != null)&&
            		(ApexPages.currentPage().getParameters().get('jobAppId') != '')){
        	review.Job_Application__c = ApexPages.currentPage().getParameters().get('jobAppId');
        	jobApplication = [select candidate__c,position__c from job_application__c where id = :review.Job_Application__c];
        	candidateId = jobApplication.candidate__c;
        	positionId = jobApplication.position__c;
        } 
        bUpdate = (review.id != null ? true : false);
        System.debug('bUpdate = ' + bUpdate);
    }
    
    public List<SelectOption> getDeptOptions() {    
    	// this function builds the list of SelectOptions for the Department field   
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('null','-- Select One --'));
        // do describe here to get the Department__c field picklist values
        Schema.DescribeFieldResult deptDFR = Schema.sObjectType.Position__c.fields.Department__c;
        for (Schema.PickListEntry deptPickVal : deptDFR.getPicklistValues()){
        	// create a selectoption for each pickval
        	options.add(new SelectOption(deptPickVal.getValue(),deptPickVal.getLabel()));
        }
        return options;
    }
    
    public List<SelectOption> getPositionOptions() {
    	// this function builds the list of selectOptions containing the position records
    	List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('null','-- Select One --'));
        // make sure a valid Department was chosen
    	if (SelectedDept != 'null') {       
	        for(Position__c p:positions){   
	            String label = p.Name + ', ' + p.location__c;    
	            options.add(new SelectOption(p.id,label));
	        }
    	}
        return options;
    }
    
    private String checkOwnerIdForQueue(String ownerId){
    	// simple helper function to check if the ownerId of the position that gets passed in is a user or queue
    	//  if it's a queue then we need to select a user at random from the queue because a task can't 
    	//   belong to a queue
    	try{
    		ownerId = [select id,(select groupid,userorgroupid from groupmembers) from group g where id=:ownerId].groupmembers[0].UserOrGroupId;
    	} catch(Exception e){
    		ApexPages.addMessages(e);
    	}
    	return ownerId;	
    }
    
    public void createJobAppAndTask(){
    	// check the ownerId of the position before creating the jobApp & task
    	//  the Task cannot be owned by a Queue
    	String ownerId = checkOwnerIdForQueue(SelectedPosition.OwnerId);
    	// create the job app first
        Job_Application__c jobApp = new Job_Application__c();
        jobApp.position__c = SelectedPositionId;
        // will have to query for the candidate__c on the selected jobApp if this Review is a new one rather than an update
        jobApp.candidate__c = candidateId == null ? [select candidate__c from job_application__c where id = :review.job_application__c].candidate__c : candidateId;
        jobApp.status__c = 'Open';
        jobApp.stage__c = 'New';
        jobApp.ownerid = ownerId;
        try{
        	insert jobApp;
        } catch (Exception e){
        	ApexPages.addMessages(e);
        }
        
        //create a task for the owner of the position
        recruiterTask.WhatId = jobApp.Id;       
        recruiterTask.OwnerId = ownerId;
        
        try{
        	insert recruiterTask;  
        } catch (Exception e){
        	ApexPages.addMessages(e);	
        }
    }
    
    // TODO: Override the standard save() method by creating an action
    //       method of the same name.
    //       If "selectedPositionId" is not null, call createJobAppAndTask()
    //       Always return a call to the save() method of the standardController. 
	
	public pageReference save(){
		If(selectedPositionId!=null){
		createJobAppAndTask();
		}
	return controller.save();
	}
}
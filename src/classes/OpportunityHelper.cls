public with sharing class OpportunityHelper {
	
	public static void notifyOMS (List<opportunity> oppList){
		
		List<FeedItem> fList = new List<FeedItem>();
		List<Task> tasks = new List<Task>();
				
		for(opportunity o : oppList)
		{
			system.debug('entered for loop');
			if(o.Approval_Status__c == 'Approved')
			{
				system.debug('entered approval');
				FeedItem post = new FeedItem();
				post.ParentId = o.Id;
				post.Body = 'Opportunity  "' + o.Name + '" deal is approved. Please work with Order Management team for processing';
				fList.add(post);
				
				tasks.add(new Task(ActivityDate = Date.today().addDays(7),Subject='Start working with Order specialist',WhatId = o.Id,OwnerId = UserInfo.getUserId(),Status='In Progress'));
			}
		
			if(o.Approval_Status__c == 'Rejected')
			{
				
				FeedItem post = new FeedItem();
				post.ParentId = o.Id;
				post.Body = 'Opportunity "' + o.Name + '" deal is Rejected. Please close it after updating analysis';
				fList.add(post);

				tasks.add(new Task(ActivityDate = Date.today().addDays(7),Subject='Please close this deal after analysis',WhatId = o.Id,OwnerId = UserInfo.getUserId(),Status='In Progress'));
			}

		}
		
		database.insert(fList);
		database.insert(tasks);
		
	// Below code fires 100 SOQL query for every opportunity update.
		
		for(integer i=0;i<=20;i++){
			
			opportunity opp = [select Id from opportunity limit 1];
		}
	}

}
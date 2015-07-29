public class MyOutstandingReview{
    
    boolean checked;
    Review__c review;
    
    MyOutstandingReview(){
    	checked=false;
    }
    
    MyOutstandingReview(Review__c r){
    	checked=false;
    	review=r;
    }
    // TODO: Declare a "checked" Boolean property to track if this record has been checked
    // TODO: Declare a "review" property to include the original review record in this wrapped object     
    
    // TODO: Declare a no-argument constructor that instantiates a new review and sets "checked" to false

    // TODO: Declare a one-argument constructor that wraps an existing review and sets "checked" to false
    
}
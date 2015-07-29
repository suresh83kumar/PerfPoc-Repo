public class MyProgrammingLanguage {
    // This class is a simple wrapper around the Programming_Language__c object
    // 	to include an extra property on the object
	
    // TODO: Create a property for the programming language record called "theRecord" being wrapped

    // TODO: Create a property for the Boolean property called "checked" for data binding the record to a checkbox

    // TODO: Create a constructor for new programming language records with a default of checked = false

    // TODO: Create a constructor for existing programming lanugage records with a default of checked = false

	public Programming_Language__c theRecord {get; set;}
	public Boolean checked {get; set;}
	
	public MyProgrammingLanguage(){
		checked = false;
		theRecord = new Programming_Language__c();
	}
	
	public MyProgrammingLanguage(Programming_Language__c p){
		checked = false;
		theRecord = p;
	}


}
@IsTest(SeeAllData=True)

public class LoadDataTest {

	static testmethod void mytest(){
	List<sObject> testdata = test.loaddata(Opportunity.sObjectType, 'Optydata');
	Opportunity myOpp = (Opportunity)testdata[0];
	String accid = myOpp.AccountId;
	system.assertEquals(accid, '001j0000002NL2w');
	}

}
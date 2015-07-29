public class versiontest{


public void mym(){
List<account> myaccount = new List<account>([select Id from Account limit 5]);

system.debug('----------Your Account--------------' + myaccount);
}

}
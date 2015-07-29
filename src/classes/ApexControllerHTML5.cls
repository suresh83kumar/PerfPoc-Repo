public class ApexControllerHTML5{
    public string Name {get; set;}
   
    public void printName(){
        System.debug('Your Name is: ' + Name);
    }
}
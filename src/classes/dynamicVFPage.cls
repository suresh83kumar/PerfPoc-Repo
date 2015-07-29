public with sharing class dynamicVFPage {

    public Component.Apex.InputText T1;
    
    public Component.Apex.InputText getT1()
    {
        Component.Apex.InputText IP = new Component.Apex.InputText();
        IP.size=20+x; 
        return IP; 
    }
    
    integer x=0;
    
    public void test()
    
    {
      x=x+10;
    }
    
}
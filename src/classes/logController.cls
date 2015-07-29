public class logController {

public string uname{get; set;}
public string pwd {get; set;}
public string res {get; set;}

public void check()
    {
        If (uname=='Acc' && pwd=='abc')
        res='User Logged Successfully.';
        else
        res='User login Invalid.';
    }

}
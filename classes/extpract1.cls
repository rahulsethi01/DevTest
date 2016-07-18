public class extpract1 {

  
    public extpract1(ApexPages.StandardController controller) {

    }
public list<UserRole> lab =new list<UserRole>();
    public list<UserRole> getValues() {
    
    lab =[SELECT Id, Name,CaseAccessForAccountOwner,RollupDescription from UserRole ];
return lab;
}
}
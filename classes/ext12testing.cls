public class ext12testing {
 
    public test__c current{get;set;}
    public ext12testing(ApexPages.StandardController controller) {
    current = (test__c)controller.getRecord(); 
    }
    
    public test__c result{get;set;}
    
    public void done()
    {
    current.Full_Name__c=current.First_Name__c +' '+ current.Last_Name__c;
    }
}
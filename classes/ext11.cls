public class ext11 {
    public test__c result1{get;set;}
    public list<test__c> res =new list<test__c>();
    public test__c current{get;set;}
    public boolean abc{get;set;}
    public ext11(ApexPages.StandardController controller) {
    current=(test__c)controller.getRecord();
    abc = false;
    }
    
    public void fullnam()
    {
    current.Full_Name__c= current.First_Name__c+' '+current.Last_Name__c;
    abc = true;
    }
    
    public  list<test__c> getwoh()
    {
    res=[select First_Name__c from test__c];
    return res;
    } 
}
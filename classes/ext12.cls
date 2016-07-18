public class ext12 {
    
    public test__c current1{get;set;}
    public ext12(ApexPages.StandardController controller) {
    current1=(test__c)controller.getRecord();
    }
    
    public void fullnam1()
    {
    current1.Full_Name__c= current1.First_Name__c + ' ' + current1.Last_Name__c;
    
    }
}
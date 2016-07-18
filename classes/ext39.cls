public with sharing class ext39 {
    public test__c current{get;set;} 
    public ext39(ApexPages.StandardController controller) {
    current=(test__c)controller.getRecord();
    }
 public void Go()
     {
   test__c  obj=new test__c();
   test1__c  obj1=new test1__c();
   
   obj.First_Name__c=current.First_Name__c; 
   obj.Last_Name__c=current.Last_Name__c;
   obj.Full_Name__c=current.Full_Name__c;
   obj.Amount__c=current.Amount__c;
       
   obj1.First_Name__c = current.Full_Name__c; 
    
   insert obj;    
   insert obj1;
     }

}
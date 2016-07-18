public with sharing class ext38 {
     
    public test__c result{get;set;}
    public test__c current{get;set;}
    
    public ext38(ApexPages.StandardController controller) {

    current=(test__c)controller.getRecord();
    }

    public void Go()
    {
 //   result=[select First_Name__c,Last_Name__c,Full_Name__c,Amount__c from test__c];
    test1__c obj=new test1__c();
    obj.First_name__c=current.First_Name__c;
  //  obj.Last_Name__c=current.Last_Name__c;
  //  obj.Full_Name__c=current.Full_Name__c;
  //  obj.Amount__c=current.Amount__c;
    
    insert obj;
    }
}
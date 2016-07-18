public with sharing class Employee {
public Employee__c current{get;set;}
    public Employee(ApexPages.StandardController controller) {
    current=(Employee__c)controller.getRecord();
    }
    
       public PageReference insert1(){
  
         Employee__c empobj = new Employee__c();      
         empobj.Name__c=current.Name__c;
         insert empobj;
    
           PageReference pageRef = new PageReference('/apex/insertion'); 
                pageRef.setRedirect(true);
                return pageRef ;
    }

}
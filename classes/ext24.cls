public class ext24 {

    public list<CloudComputing__c>data{get;set;} 
    public list<CloudComputing__c>result{get;set;} 
    public list<CloudComputing__c>result1{get;set;}
    CloudComputing__c resobj=new CloudComputing__c();  
    public string value;
    public CloudComputing__c current{get;set;}
    public ext24(ApexPages.StandardController controller) {
    current=(CloudComputing__c)controller.getRecord();
    }
    
    public list<CloudComputing__c> getdata1()
    {
    result=[select id,CRM_Name__c,Configuration__c,Charges__c,Plan__c from CloudComputing__c ];
    return result;
    }
 
 
    public void updatedata() {
    update result; 
    }
}
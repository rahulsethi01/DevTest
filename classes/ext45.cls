public with sharing class ext45 {
    public list<CloudComputing__c> cloudlist{get;set;}
    public ext45(ApexPages.StandardController controller) {
        cloudlist = [select id,name,Charges__c,Configuration__c,CRM_Name__c,Plan__c from CloudComputing__c];
    }
    public void save(){
        try{
            update cloudlist;
        }catch(Exception e){
            system.debug('=========Exception======='+e);
        }
    }
}
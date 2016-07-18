public with sharing class TestlentryExt {

    public list<test__c> addlist {get;set;}
    public id urlid;
    public list<test__c> Dellist = new list<test__c>(); 
    public list<test__c> resultdel {get;set;}
    public Integer count {get;set;}
    public test__c current {get; set;}
    public Integer val {get;set;}
    public integer val1{get;set;}
    public map<id,test__c> resourcemap = new map<id,test__c>();
    
    public TestlentryExt(ApexPages.StandardController controller) {
                                       
        current=(test__c)controller.getRecord();
        
        urlid=system.currentpagereference().getparameters().get('jolid');
        
        //addlist = new list<Event_Checklist__c>();
        addlist = [select id,name,Amount__c,First_Name__c,Last_Name__c,Full_Name__c,CloudComputing__c from test__c where CloudComputing__c  =:urlid];
                               
    }
    

    public void Save(){
        try{
              update addlist;
           ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Confirm, 'Information has been Updated!!'));              
           return;
  
        }catch(Exception e){
            system.debug('======Exception=========='+e);
        }    
    }
    

}
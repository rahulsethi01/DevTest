public with sharing class TestentryExt {

    public list<test__c> addlist {get;set;}
    public list<test__c> updatelist = new list<test__c>();
    public id urlid;
    public boolean tick{get;set;} 
    public Integer count {get;set;}
    public test__c current {get; set;}
    public Integer val {get;set;}
    public integer val1{get;set;}
    public map<id,test__c> resourcemap = new map<id,test__c>();
    
    public TestentryExt(ApexPages.StandardController controller) {
    tick = false;
                                       
        current=(test__c)controller.getRecord();
        
        urlid=system.currentpagereference().getparameters().get('tid');
        
        addlist = [select id,name,Amount__c,First_Name__c,Full_Name__c,Last_Name__c,BatchCheck__c,CloudComputing__c from test__c where CloudComputing__c =:urlid];
        
        system.debug('============addlist========='+addlist);  
          
                              
    }
    
    public void selectAll(){

        for(test__c testobj:addlist){          
            testobj.BatchCheck__c = tick;    
        } 
    }

    public void Save(){
        try{
               for(test__c testobj:addlist){
                   if(testobj.BatchCheck__c == true){
                       testobj.BatchCheck__c = false;
                       updatelist.add(testobj);
                   }
               }  
              system.debug('============updatelist========='+updatelist);
              if(updatelist.isempty() == false){
                  update updatelist;
              }
              
               system.debug('============updatelist========='+updatelist); 
               
             ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Confirm, 'Information has been Updated!!'));              
             return; 
        }catch(Exception e){
            system.debug('======Exception=========='+e);
        }    
    }
}
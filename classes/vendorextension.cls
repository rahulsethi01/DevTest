public with sharing class vendorextension {
 
    public string tempregId{get;set;}
    public list<Vendor_Registration__c>result{get;set;}
    public boolean display{get;set;}
    
    public vendorextension(ApexPages.StandardController controller) {

    }
    
    public void search()
        {
        result=[select name,Vendor_Name__c,Phone_Number_1__c,Status__c,Verified_By__c,Email_If_Any__c,Verified_By__r.Member_Name__c from Vendor_Registration__c where Vendor_Name__c like: '%'+ tempregId +'%'];
        
        if(result.isempty()==false){
        display=true;
        }else{
        display=false;
        }
        
        }
    
    public void getshow()
        {
   //     result=[select Name,Vendor_Name__c,Phone_Number_1__c,Status__c,Verified_By__c,Email_If_Any__c,Verified_By__r.Member_Name__c from Vendor_Registration__c];
   //     return result;
       }

}
trigger Countingtotals on Billing_line__c (after insert,after update) {
Set<Id> billingSetId                 = new Set<Id>();
List<Billling__c>billingList         = new List<Billling__c>();
List<Billing_line__c>billingLineList = new List<Billing_line__c>();
    
    for(Billing_line__c billobj:trigger.new){
        billingSetId.add(billobj.Billing__c);    
    }
    
    billingLineList = [select id,name from Billing_line__c where Billing__c in : billingSetId];
    
    billingList     = [select id,name,ContthroughTrigger__c from Billling__c where id in : billingSetId];
      
    for(Billling__c Blobj : billingList){
        Blobj.ContthroughTrigger__c = billingLineList.size();
    }
    update billingList;
}
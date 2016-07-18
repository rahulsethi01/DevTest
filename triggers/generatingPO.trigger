trigger generatingPO on Insurance__c (after insert,after update) {
list<Purchase_Order__c> POorderlist  = new list<Purchase_Order__c>();
list<Insurance_Lines__c> InsLineList = new list<Insurance_Lines__c>();

POorderlist = [select id,name,Insurance__c,Supplier__c from Purchase_Order__c where Insurance__c IN : trigger.newmap.Keyset()];   

InsLineList = [select id,name,Account__c,Cost__c,Insurance__c from Insurance_Lines__c where Insurance__c IN : trigger.newmap.Keyset()];

for(Insurance_Lines__c insline: InsLineList){

}

}
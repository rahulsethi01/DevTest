trigger generatePOHeader on CloudComputing__c (after insert,after update) {
    
public list<Purchase_Order__c> purchaseOrdlist = new list<Purchase_Order__c>();
public list<Purchase_Order__c> purchaseOrdlist1 = new list<Purchase_Order__c>();
public Set<Id> cloudset = new Set<Id>();

    for(CloudComputing__c cobj:trigger.new){
        cloudset.add(cobj.id);
    }

    purchaseOrdlist = [select id,name,CloudComputing__c from Purchase_Order__c where CloudComputing__c in : cloudset];
    
    if(purchaseOrdlist.isempty() == false){
        delete purchaseOrdlist;
        purchaseOrdlist.clear();
    }
    
    for(CloudComputing__c cobj:trigger.new){
        Purchase_Order__c pobj = new Purchase_Order__c();
        pobj.CloudComputing__c = cobj.id;   
        purchaseOrdlist.add(pobj);    
    }
    
    if(purchaseOrdlist.isempty() == false){
        insert purchaseOrdlist;
    }
}
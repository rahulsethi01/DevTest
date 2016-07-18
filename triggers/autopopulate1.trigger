trigger autopopulate1 on Billing_line__c (before insert) {

public list<Billling__c> result{get;set;}
public Set<Id> billset= new Set<Id>();
public map<Id,String> billmap= new map<Id,String>();

    for(Billing_line__c obj: trigger.New)
    {
    billset.add(obj.Billing__c);
    }
 result=[select id,state__c from Billling__c where Id in: billset];  
   
   for(Billling__c obj1:result)
   {
   billmap.put(obj1.id,obj1.state__c);
   }
   
   for(Billing_line__c obj: trigger.New)
   {
   //if(billmap.containsKey(obj.state__c) ){
   obj.state__c=billmap.get(obj.Billing__c);
    
  // }
}
}
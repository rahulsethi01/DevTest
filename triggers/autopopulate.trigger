trigger autopopulate on Billing_line__c (before insert) {
public list<Billling__c> billineresult{get;set;} 
public list<Billling__c> result{get;set;} 

public Set<ID>billineset= new Set<ID>();

public Map<id,string>billmap= new Map<id,string>();
public Map<id,Billling__c>billmap1= new Map<id,Billling__c>();

for(Billing_line__c obj:trigger.new)
{
billineset.add(obj.Billing__c);
}  

system.debug('======Trigger.new========'+Trigger.new);

/* More Better way then above that respects Salesforce Governor Limits */

/*for(id obj:Trigger.newMap.keyset()){
billineset.add(obj.Billing__c);
} */
system.debug('======billineset========'+billineset);

result=[select  Billing_Name__c,state__c from Billling__c where id IN : billineset];

for(Billling__c obj1:result)
   {
   billmap.put(obj1.id,obj1.state__c);
    
   billmap1.put(obj1.id,obj1);
   }
system.debug('======billmap========'+billmap);
system.debug('======billmap1========'+billmap1);
   
   for(Billing_line__c obj: trigger.New)
   {
   //if(billmap.containsKey(obj.state__c) ){
   obj.state__c=billmap.get(obj.Billing__c);

system.debug('======billmap.get(obj.Billing__c)========'+billmap.get(obj.Billing__c));
system.debug('======billmap1.get(obj.Billing__c)========'+billmap1.get(obj.Billing__c).Billing_Name__c);

   }
   

//for(Billing_line__c obj:trigger.new)
//{
//    for(Billling__c billobj:result)
//    {
//    obj.state__c=billobj.state__c;
//    }
//}

}
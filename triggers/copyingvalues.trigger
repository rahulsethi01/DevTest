trigger copyingvalues on Lumia2__c (before insert,before update) {

public Set<Id>lumia1ids = new Set<Id>();
public list<Lumia1__c>lumia1result=new list<Lumia1__c>();
public list<Lumia2__c>lumia2result=new list<Lumia2__c>();
public Map<Id,Lumia1__c>CopyMap = new Map<Id,Lumia1__c>();

for(Lumia2__c obj:Trigger.New){
    lumia1ids.add(obj.Lumia1__c);
}
    system.debug('===============lumia1ids==============='+lumia1ids); 

lumia1result=[select id,Model__c,Name__c,Price__c from Lumia1__c where id in:lumia1ids];   
    system.debug('===============lumia1result==============='+lumia1result);

    for(Lumia1__c obj:lumia1result){
        CopyMap.put(obj.id,obj);
    }
    system.debug('===============CopyMap==============='+CopyMap);
    
    for(Lumia2__c obj1:Trigger.New){
       obj1.Name__c=CopyMap.get(obj1.Lumia1__c).Name__c;
       obj1.Model__c=CopyMap.get(obj1.Lumia1__c).Model__c;
    }
    
}
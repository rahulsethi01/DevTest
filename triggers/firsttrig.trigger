trigger firsttrig on Android__c (before insert) 
{
  public list<Iphone__c>result = new list<Iphone__c>();
  public Set<Id> Appset = new Set<Id>();
  public map<id,id> conmap=new map<id,id>();
  public map<id,id> jobmap=new map<id,id>();

  try{ 
  
   for(Android__c s:trigger.new)
   {
     Appset.add(s.Androidfield__c);
   }
 
   result=[select id,Iphone_Name__c,Iphone_Price__c from Iphone__c where id IN: Appset]; 
    
   for(Iphone__c obj:result)
   {
     conmap.put(obj.id,obj.Iphone_Name__c);
     jobmap.put(obj.id,obj.Iphone_Price__c);
   }
   
   for(Android__c s1:trigger.new)
   {
     s1.Android_Name__c=conmap.get(s1.Androidfield__c);
     s1.Android_Price__c=jobmap.get(s1.Androidfield__c);
   }
}
    catch(Exception e){
    system.debug('==Exception=='+e);
}
}
trigger firsttrig2 on Android__c (before insert) {
 public list<id>Appset = new list<id>();
  public list<Iphone__c>result = new list<Iphone__c>();
   
   for(Android__c s:trigger.new)
  {
     if(s.Androidfield__c <> null)
     {
    Appset.add(s.Androidfield__c);
     } 
  }
 
  //result=[select id,Iphone_Name__c,Iphone_Price__c from Iphone__c where id=:Appset.id]; 
    
 //   for(Iphone__c obj:result)
  //  {
  //   Android_Name__c=obj.Iphone_Name__c;
  //   Android_Price__c=obj.Iphone_Price__c;
    
 //   for(Android__c s1:trigger.new)
 //       {
  // s1.Android_Name__c=obj.Android_Name__c;
 //  s1.Android_Price__c=obj.Android_Price__c;
  //      }
  //   }    
}


//trigger firsttrig on Android__c (before insert) {
//public list<Iphone__c>obj = new list<Iphone__c>();
//    for(Android__c s:trigger.new)
//    {
//    Iphone__c st = new Iphone__c();
//    st.Iphone_Name__c=s.Android_Name__c;
//    st.Iphone_Price__c=s.Android_Price__c;
//    obj.add(st);    
//    }

//    insert obj;
//}
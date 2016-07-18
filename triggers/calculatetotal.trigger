trigger calculatetotal on Billling__c (after insert,before update) {
 public list<Billling__c> result{get;set;}
 
 public Set<Decimal>POSet = new Set<Decimal>();
 public map<decimal,decimal>pomap=new map<decimal,decimal>();
 
//try
//{ 
 for(Billling__c s:trigger.new)
     {
     if(s.Billing_PO_Number__c<>null)
         {
         POSet.add(s.Billing_PO_Number__c);
         }
     }
   result=[select id,Billing_PO_Number__c,Total_Cost__c,FinalCostTotal__c from Billling__c where Billing_PO_Number__c IN:POSet];

     for(Billling__c s1: result){     
         if(pomap.containsKey(s1.Billing_PO_Number__c)){
            if(s1.Total_Cost__c <> null){
                //DEcimal SubT = pomap.get(s1.Billing_PO_Number__c) + s1. Total_Cost__c;
            
        Decimal SubT=pomap.get(s1.Billing_PO_Number__c) + s1.Total_Cost__c ;
            
                pomap.put(s1.Billing_PO_Number__c,SubT);
            }
         }
         }
     system.debug('========pomap============'+pomap);  
     
     for(Billling__c s1: result){
          if(pomap.ContainsKey(s1.Billing_PO_Number__c)){
              s1.FinalCostTotal__c = pomap.get(s1.Billing_PO_Number__c);  
          }
     }
        
     //update result;

/*}Catch(Exception e){
      system.debug('=============e==========='+e);
   } */
}
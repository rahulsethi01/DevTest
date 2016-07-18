trigger TestTriggerOpp on Opportunity (after insert) {
Set<Id> OppSet = new Set<Id>(); 
List<Opportunity> opplist = new List<Opportunity>();
    
    for(Opportunity opp : trigger.new){
        if(opp.StageName == 'Closed Won'){
            OppSet.add(opp.id);
        }
    }
    
    if(OppSet.isempty() == false){
        OppUpdation.updatingoppamount(OppSet);    
    }
   
  /* opplist = [select id,name,Amount from Opportunity Where id in : OppSet]; 
 
     for(Opportunity oppobj : opplist){
         oppobj.Amount = 100;    
     } 
   
     update opplist;
  */
    
}
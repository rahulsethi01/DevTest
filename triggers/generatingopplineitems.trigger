trigger generatingopplineitems on Opportunity (after insert,after update) {
Set<Id> oppset           = new Set<Id>();    
list<Opportunity>opplist = new list<Opportunity>();
    for(Opportunity opp:trigger.new){
        if(opp.stageName == 'Closed Won'){
            oppset.add(opp.id);
        }
    }    
    
opplist = [select id,name from Opportunity Where id in : oppset];    
}
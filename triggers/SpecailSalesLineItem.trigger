trigger SpecailSalesLineItem on OpportunityLineItem (after insert,after update) {
Set<Id> opplineset = new Set<Id>();
Set<Id> oppset     = new Set<Id>();
list<OpportunityLineItem> opplinelist = new list<OpportunityLineItem>();   
list<OpportunityLineItem> oppspeciallinelist = new list<OpportunityLineItem>();  
    
    for(OpportunityLineItem oppline : trigger.new){
        if(oppline.OpportunityStage__c == 'Closed Won'){
            opplineset.add(oppline.id);
            oppset.add(oppline.OpportunityId);
        }    
    }    
    
    opplinelist = [select id,name from OpportunityLineItem Where id in : opplineset];
    
    oppspeciallinelist = [select id,name,OpportunityId from OpportunityLineItem Where OpportunityId in : oppset AND Sales_Line_Item__c = true];
    
     
}
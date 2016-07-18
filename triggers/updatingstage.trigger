trigger updatingstage on Opportunity (after insert) {
    Set<Id>OppsetId = new Set<Id>(); 
    List<Opportunity>Opplist  = new List<Opportunity>();
    try{       
        for(Opportunity opp:trigger.new){
            OppsetId.add(opp.id);
        }
        system.debug('========OppsetId========='+OppsetId);
        
        Opplist = [Select id,name,stagename,Stage_dup__c from Opportunity where id in : OppsetId and Stage_dup__c <> Null];
        system.debug('========Opplist========='+Opplist);
        
        for(Opportunity obj: Opplist){
            obj.stagename = obj.Stage_dup__c;
        }
        if(Opplist.isempty() == false){
            update Opplist;
        }
    }catch(Exception e){
        system.debug('=============Exception=========='+e);
    }    
}
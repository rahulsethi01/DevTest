trigger OppUnditable on Opportunity (before update) {
    for(Opportunity opp :trigger.new){
        //if(opp.Amount!=Trigger.oldMap.get(opp.id).Amount){
            opp.addError('You cannot Edit Opportunity');
        //}  
    }
}
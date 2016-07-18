trigger trgr_OpportunityRedirectAfterClosed on Opportunity (after Insert, after Update) {
List<Opportunity> opptyToUpdate = new List<Opportunity>();
    
    for(Opportunity oppty : trigger.new){
        if(oppty.IsClosed && String.isBlank(oppty.URL__c)){
        opptyToUpdate.add(
        new Opportunity(
        Id = oppty.Id,
        URL__c = 'https://www.google.com'
        )
        );
        }
    }
    UPDATE opptyToUpdate;
}
trigger GenerateQuote on Opportunity (after insert,after update) {
public list<Opportunity> Opplist = new list<Opportunity>();
public set<Id> OppSetId = new set<Id>();
public map<id,Opportunity> oppmap = new map<id,Opportunity>();
public list<Quote> Quotelist = new list<Quote>();
public map<Id,Quote>quotemap = new map<Id,Quote>();
try{
    Opplist = [select id,name,StageName from Opportunity where id in: Trigger.newMap.keySet() AND StageName = 'Prospecting'];
    system.debug('=======Opplist========'+Opplist);

    for(Opportunity oopobj : Opplist){        
        OppSetId.add(oopobj.id);
        oppmap.put(oopobj.id,oopobj); 
    } 
    system.debug('=======OppSetId=========='+OppSetId);
    system.debug('=======oppmap============'+oppmap);
    
    Quotelist = [select id,Name,OpportunityId from Quote where OpportunityId in: OppSetId];
    
    system.debug('==========Quotelist========'+Quotelist);
    
    for(Quote quoteobj:Quotelist){
         quotemap.put(quoteobj.OpportunityId,quoteobj);
    }
    system.debug('===========quotemap=========='+quotemap);
        
    if(Opplist.isempty() == false){
        for(Opportunity oppobjnew:trigger.new) { 
          Quote quoteobj; 
            if(!quotemap.ContainsKey(oppobjnew.id)){
               system.debug('=========Insert========');
                          quoteobj = new Quote();
                          quoteobj.OpportunityId                        =  oppobjnew.id;
                          quoteobj.Name                                 =  oppobjnew.name;    
                      
            }else{
               system.debug('========Update=========');
                  quoteobj = quotemap.get(oppobjnew.id);
                  quoteobj.Name  =  oppobjnew.name; 
                   
             } 
              quotemap.put(quoteobj.OpportunityId,quoteobj);
        }  
         system.debug('===========quotemap=========='+quotemap);
         
        if(quotemap.Values().isempty() == false){
            upsert quotemap.Values();
        }
        system.debug('===========quotemap=========='+quotemap);
    }
}
catch(Exception e){
    system.debug('=======Exception======'+e);
}
}
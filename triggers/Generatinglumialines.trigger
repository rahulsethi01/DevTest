trigger Generatinglumialines on Opportunity (before insert,before update,before delete) {

    public list<Opportunity>Opplist = new list<Opportunity>();
    public set<Id>OppSetId = new set<Id>();
    public set<Id>OppOldSetId = new set<Id>();
    public Map<Id,Opportunity>OppMap = new Map<Id,Opportunity>();
    public list<Lumia1__c>lumia1list = new list<Lumia1__c>();
    public list<Lumia2__c>lumia2list = new list<Lumia2__c>();
    
    public list<Lumia1__c>lumia1deletelist = new list<Lumia1__c>();
    public list<Lumia2__c>lumia2deletelist = new list<Lumia2__c>();
    
   try {   
   
  // if(trigger.isinsert || trigger.isupdate){                                                                              
  /***  for(Opportunity oppobj:trigger.new) {
        OppSetId.add(oppobj.id);
    }  ***/
    
    system.debug('==================OppSetId====================='+OppSetId);

    opplist=[select id,name,Amount,LeadSource,ExpectedRevenue from Opportunity where id in:Trigger.newMap.keySet()];  
 
    system.debug('==================opplist====================='+opplist);
    if(opplist.isempty()==false){
    for(Opportunity oppobj:opplist) {     
        OppMap.put(oppobj.id,oppobj); 
        }    
    }
    
    lumia1list = [select Name__c,Model__c,Price__c,Opportunity__c from Lumia1__c where Opportunity__c in: OppSetId];
    
    lumia2list = [select Name__c,Model__c,Lumia1__c,Opportunity__c from Lumia2__c where Opportunity__c in :OppSetId];
    
    if(lumia1list.isempty()==true){
         Lumia1__c lum1insobj = new Lumia1__c();
         lumia1list.add(lum1insobj);
     }
    
     if(lumia2list.isempty()==true){
         Lumia2__c lum2insobj = new Lumia2__c();
         lumia2list.add(lum2insobj);
     } 
     
    for(Opportunity oppobjnew:trigger.new) {     
        for(Lumia1__c lum1obj:lumia1list){   
              lum1obj.Opportunity__c =  oppobjnew.id;
              lum1obj.Name__c  =  oppobjnew.name; 
              lum1obj.Price__c =  oppobjnew.ExpectedRevenue;  
              lum1obj.Model__c =  oppobjnew.LeadSource;  
        }
    //  upsert lumia1list;
         
    for(Lumia2__c lum2obj:lumia2list){   
    
              lum2obj.Opportunity__c = oppobjnew.id;
              lum2obj.Lumia1__c =  lumia1list[0].id;
              lum2obj.Name__c  =   oppobjnew.name; 
              lum2obj.Model__c =   oppobjnew.LeadSource;  
       } 
  }
            
   //     upsert lumia2list;
// }       
    if(trigger.isdelete){
    for(Opportunity oppobject: trigger.old) {
    OppOldSetId.add(oppobject.id);
    }      
     system.debug('============= OppOldSetId ================'+OppOldSetId);
       
    lumia1deletelist =[select id,Opportunity__c from Lumia1__c where Opportunity__c in : OppOldSetId];
    
    system.debug('============= lumia1deletelist ================'+lumia1deletelist);
       
    lumia2deletelist =[select id,Opportunity__c from Lumia2__c where Opportunity__c in : OppOldSetId]; 
    
    delete lumia1deletelist;
    delete lumia2deletelist;    
     } 
   }                                                                                                               
   catch(Exception e)
   {      
    }                                                                                                                                                                                                
}
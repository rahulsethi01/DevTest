public with sharing class oppcontroller {

    public id oppid;
    public list<Opportunity>Opplist = new list<Opportunity>();
    public set<Id>OppSetId = new set<Id>();
    public Map<Id,Opportunity>OppMap = new Map<Id,Opportunity>();
    public list<Lumia1__c>lumia1list = new list<Lumia1__c>();
    public list<Lumia2__c>lumia2list = new list<Lumia2__c>();
      
    public string opportunityVfid{get;set;}
    
    public oppcontroller(ApexPages.StandardController controller) {
    }
    
    public void dorequest(){                                                                                            // function used in Vf page
    
   try {                                                                                                               // try statement execution 
        system.debug('current Page Reference ' + System.currentPageReference().getParameters().get('id'));
   
        oppid = System.currentPageReference().getParameters().get('id'); 
        if(oppid != null){
        opportunityVfid = oppid;

    opplist=[select id,name,Amount,LeadSource,ExpectedRevenue from Opportunity where id=:oppid];  
 
    system.debug('============opplist=========='+opplist);
    if(opplist.isempty()==false){
    for(Opportunity oppobj:Opplist) {    
        OppSetId.add(oppobj.id);  
        OppMap.put(oppobj.id,oppobj); 
        }    
    }
    system.debug('============OppSetId=========='+OppSetId);
    system.debug('============OppMap=========='+OppMap);
    
    lumia1list = [select Name__c,Model__c,Price__c,Opportunity__c from Lumia1__c where Opportunity__c=:oppid];
    
    lumia2list = [select Name__c,Model__c,Lumia1__c,Opportunity__c from Lumia2__c where Opportunity__c=:oppid];
    
    if(lumia1list.isempty()==true){
         Lumia1__c lum1insobj = new Lumia1__c();
         lumia1list.add(lum1insobj);
     }
    
     if(lumia2list.isempty()==true){
         Lumia2__c lum2insobj = new Lumia2__c();
         lumia2list.add(lum2insobj);
     } 
        
    for(Lumia1__c lum1obj:lumia1list){   
        lum1obj.Opportunity__c =  oppid;
        lum1obj.Name__c  =  OppMap.get(oppid).name; 
        lum1obj.Price__c =  OppMap.get(oppid).ExpectedRevenue;  
        lum1obj.Model__c =  OppMap.get(oppid).LeadSource;  
    }
        upsert lumia1list;
        
        
    for(Lumia2__c lum2obj:lumia2list){   
    
        lum2obj.Opportunity__c =  oppid;
        lum2obj.Lumia1__c =  lumia1list[0].id;
        lum2obj.Name__c  =   OppMap.get(oppid).name; 
        lum2obj.Model__c =   OppMap.get(oppid).LeadSource;  
    }   
        upsert lumia2list;
        
     }  
    }                                                                                                                 // finishing try statement
   catch(Exception e)
  {      
    }                                                                                                               // finishing catch exception
    
    }                                                                                                                // ending doRequest() function 
    
}
trigger CalculatingSalestax on OpportunityLineItem (after insert) {

    public set<Id> opplineset = new set<Id>();
    public map<Id,Id> opplinemap= new map<Id,Id>();
    public map<Id,Id> oppmap= new map<Id,Id>();
    public map<Id,Id> opppricebk= new map<Id,Id>();
    public map<String,PricebookEntry> pricebkmap= new map<String,PricebookEntry>();
    
    public map<Id,String> accmap = new map<Id,String> ();
    public map<String,Id> prodmap = new map<String,Id> ();
    public map<id,string> prodmapNew = new map<id,string> ();
    public map<string,Product2> prodmap1 = new map<string,Product2> ();
    public List<Opportunity> opplist= new List<Opportunity>();
    public List<Account> accountlist= new List<Account>();
    public list<Product2> prodlist = new list<Product2>();
    public list<Product2> prodlistNew = new list<Product2>();
    public list<PricebookEntry> pricebooklist = new list<PricebookEntry>();
    public list<PricebookEntry> pricebooklistnew = new list<PricebookEntry>();
    public List<OpportunityLineItem> oppLineListExist= new List<OpportunityLineItem>();
    public set<string> productnames = new set<string>();
    public Map<string,OpportunityLineItem> OppLineMapExist= new Map<string,OpportunityLineItem>();
    public list<OpportunityLineItem> opplinefinallist = new list <OpportunityLineItem>();
    public Map<id,opportunity> oppNameMap= new Map<id,opportunity>();
try {

    for(OpportunityLineItem opplineobj: trigger.new){ 
        opplineset.add(opplineobj.product2id); 
        opplinemap.put(opplineobj.id,opplineobj.Opportunityid);   
    }
    oppLineListExist=[select id, name,UnitPrice, Opportunityid from OpportunityLineItem where Opportunityid  IN: opplinemap.values()];
    opplist=[select id,name,Pricebook2Id,AccountId from Opportunity where id in : opplinemap.values()];
    
    for(OpportunityLineItem opplineobj: oppLineListExist){
                OppLineMapExist.put(opplineobj.name,opplineobj);
    }
    system.debug('===========OppLineMapExist========='+OppLineMapExist);
    
    for(Opportunity oppobj:opplist) {
        oppmap.put(oppobj.id,oppobj.AccountId);
        oppNameMap.put(oppobj.id,oppobj);
        opppricebk.put(oppobj.id,oppobj.Pricebook2Id);
    } 
    
    accountlist=[select id,name,Sales_Tax_Info__c from Account where id in : oppmap.values()];
    system.debug('===========accountlist========='+accountlist);
    
    for(Account accobj:accountlist) { 
        accmap.put(accobj.id,accobj.Sales_Tax_Info__c);
    } 
    system.debug('===========accmap========='+accmap);
      
    productnames.add('Sales Tax Colorado');
    productnames.add('Sales Tax Loveland / Larimer / Colorado');
    productnames.add('Sales Tax Larimer / Colorado');  
       
    prodlist = [select id,name,AcctSeed__Tax_Rate__c,AcctSeed__Accounting_Type__c from Product2 where name in :productnames]; 
    prodlistNew = [select id,name,AcctSeed__Tax_Rate__c,AcctSeed__Accounting_Type__c from Product2 where id in :opplineset]; 
    system.debug('===========prodlist========='+prodlist);
      
    for(Product2 prodobj:prodlist) {
        prodmap.put(prodobj.name,prodobj.id);
        prodmap1.put(prodobj.name,prodobj);
    }
    for(Product2  prodobj: prodlistNew) {
        prodmapNew.put(prodobj.id,prodobj.AcctSeed__Accounting_Type__c);   
    }
    
    system.debug('===========prodmap========='+prodmap);
   
   pricebooklist = [select id,pricebook2id,Product2Id from PricebookEntry where pricebook2id in : opppricebk.values() AND Product2Id in: prodmap.values()];
    
   for(PricebookEntry pblist: pricebooklist) {
       pricebkmap.put(pblist.Product2Id+'-'+pblist.pricebook2id ,pblist);
   }
   
   system.debug('====pricebooklist==='+pricebooklist);
   system.debug('====pricebkmap==='+pricebkmap);
   
     if(Trigger.IsInsert == True){
  
    for(OpportunityLineItem newopplineobj: trigger.new){
    //system.debug('=======oppNameMap.get(newopplineobj.id).name===='+oppNameMap.get(newopplineobj.id).name);
    system.debug('======OpLineMapExist=='+(oppNameMap.get(opplinemap.get(newopplineobj.id)).name+' Sales Tax '+accmap.get(oppmap.get(opplinemap.get(newopplineobj.id)))));
    system.debug('======OpLineMapExist=='+(OppLineMapExist.get(oppNameMap.get(opplinemap.get(newopplineobj.id)).name+' Sales Tax '+accmap.get(oppmap.get(opplinemap.get(newopplineobj.id))))));
     
      if(OppLineMapExist.containsKey(oppNameMap.get(opplinemap.get(newopplineobj.id)).name+' Sales Tax '+accmap.get(oppmap.get(opplinemap.get(newopplineobj.id)))) == False){
        if(newopplineobj.Oppprodcheck__c==false) {    
        if((accmap.get(oppmap.get(opplinemap.get(newopplineobj.id))) == 'Loveland / Larimer / Colorado' || accmap.get(oppmap.get(opplinemap.get(newopplineobj.id)))  == 'Larimer / Colorado' || accmap.get(oppmap.get(opplinemap.get(newopplineobj.id))) == 'Colorado'))  
        {

 system.debug('==========New Prod Map get====='+prodmap.get('Sales Tax '+accmap.get(oppmap.get(opplinemap.get(newopplineobj.id)))));
 system.debug('====pricebkmap.get()==='+pricebkmap.ContainsKey( prodmap.get('Sales Tax '+accmap.get(oppmap.get(opplinemap.get(newopplineobj.id))))));
        if(pricebkmap.ContainsKey( prodmap.get('Sales Tax '+accmap.get(oppmap.get(opplinemap.get(newopplineobj.id)))) +'-'+opppricebk.get(opplinemap.get(newopplineobj.id)))==false){
        
        PricebookEntry pbe = new PricebookEntry();
            pbe.Product2Id = prodmap.get('Sales Tax '+accmap.get(oppmap.get(opplinemap.get(newopplineobj.id))));
            pbe.Pricebook2Id= opppricebk.get(opplinemap.get(newopplineobj.id));
            pbe.IsActive= true;
            pbe.UnitPrice=1.0;
            pricebooklistnew.add(pbe);
        }   
    
   }       
 } 
   }
  } 
   system.debug('====pricebooklistnew==' +pricebooklistnew);
   
     if(pricebooklistnew.isempty()==false) { 
         insert pricebooklistnew;
     }   
        
   system.debug('================pricebooklist============='+pricebooklist);
      
     for(PricebookEntry prblist : pricebooklistnew){    
          pricebkmap.put(prblist.Product2Id+'-'+prblist.pricebook2id ,prblist);
     }    
     system.debug('=====pricebkmap==='+pricebkmap);
     
     for(OpportunityLineItem newopplineobj1: trigger.new){
    
         if(newopplineobj1.Oppprodcheck__c==false) {
         if((accmap.get(oppmap.get(opplinemap.get(newopplineobj1.id))) == 'Loveland / Larimer / Colorado' || accmap.get(oppmap.get(opplinemap.get(newopplineobj1.id)))  == 'Larimer / Colorado' || accmap.get(oppmap.get(opplinemap.get(newopplineobj1.id))) == 'Colorado')  && prodmapNew.containsKey(newopplineobj1.Product2Id) == True ) 
         { 
          if( prodmapNew.get(newopplineobj1.Product2Id) == 'Taxable Product'){ 
     if(OppLineMapExist.containsKey(oppNameMap.get(opplinemap.get(newopplineobj1.id)).name+' Sales Tax '+accmap.get(oppmap.get(opplinemap.get(newopplineobj1.id)))) == False){
    
      if(pricebkmap.ContainsKey(prodmap.get('Sales Tax '+accmap.get(oppmap.get(opplinemap.get(newopplineobj1.id))))+'-'+opppricebk.get(opplinemap.get(newopplineobj1.id)))==true){
      
      OpportunityLineItem  opplineitemobject = new OpportunityLineItem();
      opplineitemobject.Quantity = 1;
      opplineitemobject.UnitPrice = ((newopplineobj1.UnitPrice * prodmap1.get('Sales Tax '+accmap.get(oppmap.get(opplinemap.get(newopplineobj1.id)))).AcctSeed__Tax_Rate__c)/100)*newopplineobj1.Quantity ;
      opplineitemobject.OpportunityId = opplinemap.get(newopplineobj1.id);
      opplineitemobject.PriceBookEntryId = pricebkmap.get(prodmap.get('Sales Tax '+accmap.get(oppmap.get(opplinemap.get(newopplineobj1.id))))+'-'+opppricebk.get(opplinemap.get(newopplineobj1.id))).id;
      opplineitemobject.Oppprodcheck__c=true;
      opplinefinallist.add(opplineitemobject);
     } 
         
 }
     else{
       OppLineMapExist.get(oppNameMap.get(opplinemap.get(newopplineobj1.id)).name+' Sales Tax '+accmap.get(oppmap.get(opplinemap.get(newopplineobj1.id)))).UnitPrice = OppLineMapExist.get(oppNameMap.get(opplinemap.get(newopplineobj1.id)).name+' Sales Tax '+accmap.get(oppmap.get(opplinemap.get(newopplineobj1.id)))).UnitPrice + ((newopplineobj1.UnitPrice * prodmap1.get('Sales Tax '+accmap.get(oppmap.get(opplinemap.get(newopplineobj1.id)))).AcctSeed__Tax_Rate__c)/100)*newopplineobj1.Quantity ;
   }     
     }   
    
   } 
     system.debug('=====opplinefinallist==='+opplinefinallist);   
   }
   
   }
       if(opplinefinallist.IsEmpty() == False){
         insert opplinefinallist;   
       }
       update OppLineMapExist.values();
       }
       
  /***** if(Trigger.IsUpdate == True){  
       }
       if(Trigger.IsDelete == True){
       
       }  *****/
    }
   
   catch(Exception e) {
   system.debug('===========Exception========='+e);
   } 
}
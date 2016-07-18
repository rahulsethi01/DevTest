trigger generatingPurchaseOrders on CloudComputing__c (after update) {
    public Set<Id> cloudset                                   = new Set<Id>();
    public Set<Id> cloudsupplierSet                           = new Set<Id>();
    public list<Cloud_Lines__c> cloudlines                    = new list<Cloud_Lines__c>();
    public Map<Id,decimal> cloudmapvalues                     = new Map<Id,decimal>();
    public Map<Id,Cloud_Lines__c> cloudmapfull                = new Map<Id,Cloud_Lines__c>();
    public Map<Id,Cloud_Lines__c> cloudmapfullSupplier        = new Map<Id,Cloud_Lines__c>();
    public list<Purchase_Order__c> purchaseorderlist          = new list<Purchase_Order__c>();
    public list<Purchase_Order_Line__c> purchaseorderlineList = new list<Purchase_Order_Line__c>();
    public list<CloudComputing__c>CloudCompList               = new list<CloudComputing__c>();  
    public list<Cloud_Lines__c> supplierList                  = new list<Cloud_Lines__c>();
    
    cloudlines = [select id,name,Supplier__c,CloudComputing__c,Quantity__c,Whole_Sale_Price__c from Cloud_Lines__c where CloudComputing__c in : trigger.newMap.Keyset()]; 
    
   
    CloudCompList = [select id,name,Trigger_Check__c from CloudComputing__c where id in : trigger.newMap.Keyset()]; 
    
    if(CloudCompList[0].Trigger_Check__c == true){
    
       supplierList = [select Supplier__c from Cloud_Lines__c where CloudComputing__c in : trigger.newMap.Keyset() AND Supplier__c <> NULL];
       
       system.debug('=======supplierList========='+supplierList);
       
    if(supplierList.isempty() == true){
    system.debug('=====hello error=======');
        trigger.new[0].addError('There is No Supplier');
    } else{
          
    for(Cloud_Lines__c cdlinesobj: cloudlines){
        if(cdlinesobj.Supplier__c <> NULL){
            cloudsupplierSet.add(cdlinesobj.Supplier__c);
            cloudmapfull.put(cdlinesobj.id,cdlinesobj);
            //cloudmapvalues.put(cdlinesobj.Supplier__c,cdlinesobj.Whole_Sale_Price__c);
            
            if(cloudmapvalues.ContainsKey(cdlinesobj.Supplier__c)){
        
               decimal Salesprice =  cloudmapvalues.get(cdlinesobj.Supplier__c);
               Salesprice += cdlinesobj.Whole_Sale_Price__c;
               cloudmapvalues.put(cdlinesobj.Supplier__c,Salesprice);
                
            }else{
                cloudmapvalues.put(cdlinesobj.Supplier__c,cdlinesobj.Whole_Sale_Price__c);
            }
        }
        
        if(!cloudmapfullSupplier.ContainsKey(cdlinesobj.Supplier__c)){
         Purchase_Order__c purobj     = new Purchase_Order__c();
             purobj.CloudComputing__c = cloudmapfull.get(cdlinesobj.id).CloudComputing__c;
             purobj.Supplier__c       = cdlinesobj.Supplier__c;
             purobj.Cloud_Lines__c    = cdlinesobj.id;    
             
             purchaseorderlist.add(purobj);
        }       
         cloudmapfullSupplier.put(cdlinesobj.Supplier__c,cdlinesobj);
    } 
   
   
   
   list<Purchase_Order__c> PO = [select id from Purchase_Order__c where CloudComputing__c IN: trigger.newMap.Keyset()];
   
   delete PO;
   
   set<id> IdSet = new set<id>();
   for(Purchase_Order__c p: PO){
     IdSet.add(p.id);
   }
   
   
   list<Purchase_Order_Line__c > POl = [select id from Purchase_Order_Line__c  where Purchase_Order__c    IN: IdSet];
   
   delete POl;
    if(purchaseorderlist.isempty() == false){
        upsert purchaseorderlist;    
    }
    
    
    for(Purchase_Order__c pordobj: purchaseorderlist){       
    
            Purchase_Order_Line__c purorderline = new Purchase_Order_Line__c();              
                purorderline.Quantity__c         = 1;
                purorderline.Purchase_Order__c   = pordobj.id;
                
                purorderline.Whole_Sale_Price__c = cloudmapvalues.get(pordobj.Supplier__c);
                purchaseorderlineList.add(purorderline);
     
    }
    
    if(purchaseorderlineList.isempty() == false){
        upsert purchaseorderlineList;
    }

    CloudCompList[0].Trigger_Check__c = false;  
    
    if(CloudCompList.isempty() == false){
        update CloudCompList;
    }  
      
   }
   }
}
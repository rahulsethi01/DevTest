trigger updatingNewAmount on Account (after insert,after update) {
    list<Account> accountlist = new list<Account>();
    set<id> accountids = new set<id>();
 try{
     if(ValidationCls.chkupdate <> false) {   
    
       for(Account accobj: trigger.new){ 
           accountids.add(accobj.id);
       }  
  
     if(accountids.isempty() == false){
         AccountCreation.updatingNewAmount(accountids); 
     } 
      
        /*for(Account obj:trigger.new){
            accset.add(obj.id);
        }
        
        accountlist = [select id,name,Amount__c,New_Amount__c from Account where id in:accset];
        
        for(Account obj:accountlist){
           
            obj.New_Amount__c = obj.Amount__c;
        }
        
        if(accountlist.isempty()==false ){
            ValidationCls.updatefun(); 
            update accountlist;
        } */
     }
   }  
     catch(Exception e){
         system.debug('======Exception========'+e);
     }
}
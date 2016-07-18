global class AccountCreation {

  @future 
  
   public static void updatingNewAmount(Set<ID> accountids) {
        
       list<Account> accountlist = [select id,name,Amount__c,New_Amount__c from Account where id in:accountids];
        
        for(Account obj:accountlist){
            obj.New_Amount__c = obj.Amount__c;       
        }
        
        if(accountlist.isempty()==false ){
           // ValidationCls.updatefun(); 
            update accountlist;
        }
   }

}
trigger SendingEmailtoUsers on Account (after update) {
    list<Account> accountlist = new list<Account>();
    set<id> accountids        = new set<id>();
    list<String> useremailset  = new list<String>();
    list<User> userlist       = new list<User>();
    List<Id> UserIds=new List<Id>();
 try{ 
       for(Account accobj: trigger.new){ 
           accountids.add(accobj.id);
       }  
  
     /*if(accountids.isempty() == false){
         AccountCreation.updatingNewAmount(accountids); 
     }*/
     
     accountlist = [select id,Selected_Users__c from Account where id in : accountids];
        system.debug('==========accountlist======='+accountlist);
        
       

        for(Account cdr: accountlist){
        string strusr = cdr.Selected_Users__c;
            String[]  strs =  strusr.split(',');
            for(String s :strs){
            useremailset.add(s);    
        }
        }
        system.debug('==========useremailset======='+useremailset); 
           
       // String  valstring = 'a,b,c,d';

//        String[]  strs =  valstring.spilt(',');  
           
        userlist = [select id,name,email from User where email in : useremailset]; 
        system.debug('==========userlist======='+userlist);
        
        for(User u: userlist) {
            UserIds.add(u.Id);
        }
        system.debug('==========UserIds======='+UserIds);
        
        EmailTemplate template =  [SELECT Id, Name FROM EmailTemplate WHERE DeveloperName = 'Account_tremplate' LIMIT 1];
        
        Messaging.MassEmailMessage emails=new Messaging.MassEmailMessage(); 
        emails.setTargetObjectIds(UserIds);    
        emails.setTemplateId(template.Id);
        emails.saveAsActivity = false; 
        Messaging.SendEmail(New Messaging.MassEmailMessage[]{emails});
        
    /************************************************************************/            
     }catch(Exception e){
     system.debug('========Exception======'+e);
     }
  }
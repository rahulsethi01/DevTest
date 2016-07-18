public with sharing class ext53 {
public String Name1 {get;set;}
public String Name {get;set;}
    public ext53(ApexPages.StandardController controller) {
        selectedaccounts = new List<SelectOption>();
    }

   public SelectOption[] selectedaccounts {get;set;}
      
    public List<SelectOption> getallaccounts() {
        List<SelectOption> Options = new List<SelectOption>();
        Options.add(new SelectOption('None','None'));
        Options.add(new SelectOption('Cricket','Cricket'));
        Options.add(new SelectOption('Hockey','Hockey'));
        Options.add(new SelectOption('Swimming','Swimming'));
        Options.add(new SelectOption('Rugby','Rugby'));
        return Options;
    }
    
    public PageReference sav() {
    system.debug('====hi=======');
     system.debug('====selectedaccounts======='+selectedaccounts);
        Account acc = new Account();
       // acc.Name = 'test';

        if(acc.Name == NULL || acc.Name == ''){
         ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please Enter Atleast One Data...'));          
                         return null;
        }
        
        selectedaccounts = new List<SelectOption>();
        
           String userselected = '';
            Boolean Start = true;
            system.debug('===userselected====='+userselected);
            system.debug('===selectedaccount====='+selectedaccounts);
            for(SelectOption Str : selectedaccounts) {
                if(Start) {
                    userselected  = Str.getValue();
                    Start = false;
                } else {               
                    userselected = userselected + ';' + Str.getValue();              
                }
            }    
            system.debug('===userselected====='+userselected);
                acc.Selected_Users__c = userselected;
                insert acc;
                
                PageReference pageRef = new PageReference('/'+acc.id); 
                pageRef.setRedirect(true);
                return pageRef ; 
    }

}
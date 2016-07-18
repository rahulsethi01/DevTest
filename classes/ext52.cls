public with sharing class ext52 {
    
    public Account accrequest{get;set;}
    public string xyz;
    public string xyz1;
    public SelectOption[] selectedaccounts {get;set;}

    
    public ext52(ApexPages.StandardController controller) {
            selectedaccounts = new List<SelectOption>();
        accrequest = new Account();
        accrequest.Name = 'abc';
        accrequest.Amount__c = 10;
 
    }
        
    public List<SelectOption> getallaccounts() {
        List<SelectOption> Options = new List<SelectOption>();
        Options.add(new SelectOption('None','None'));
        Options.add(new SelectOption('Cricket','Cricket'));
        Options.add(new SelectOption('Hockey','Hockey'));
        Options.add(new SelectOption('Swimming','Swimming'));
        Options.add(new SelectOption('Rugby','Rugby'));
        return Options;
    }


    
    public void save() {
    system.debug('====hi=======');
        Account acc = new Account();
        acc.Name = 'test';
        

        
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
    }

}
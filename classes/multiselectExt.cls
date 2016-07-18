public with sharing class multiselectExt {
    public string SelectedVal{get;set;}
    public string Usernames{get;set;}
    public multiselectExt(ApexPages.StandardController controller) {

    }
        public List<SelectOption> getItems() {
            List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('US','US'));
            options.add(new SelectOption('CANADA','Canada'));
            options.add(new SelectOption('MEXICO','Mexico'));
            return options;
        }
        
         public void clickNew(){
             system.debug('==========Usernames==========='+Usernames);
             system.debug('============SelectedVal========='+SelectedVal);
         }
}
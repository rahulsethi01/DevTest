public with sharing class PricebookwithSecurity {
    
    public list<User> userlist{get;set;}
    public list<User> finaluserlist = new list<User>();
    
    public PricebookwithSecurity(ApexPages.StandardController controller) {
        userlist = [select id,name,User_PriceBook_Id__c from User];
    } 
    
    public List<SelectOption> getpricebook(){
        List<SelectOption> options = new list<SelectOption>();
        for(pricebook2 pb:[select id,name from pricebook2 where isactive = true]) {
            options.add(new SelectOption(pb.id,pb.name));
        }
        return options;
    }
    
    public void saveok(){
        
        finaluserlist.clear();
        
        for(user userint:userlist){
            if(userint.User_PriceBook_Id__c <> NULL && userint.User_PriceBook_Id__c <> '[]'){
                finaluserlist.add(userint);    
            }
            update finaluserlist;
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.info,'Your Preference are saved now...'));
        } 
    }
    
}
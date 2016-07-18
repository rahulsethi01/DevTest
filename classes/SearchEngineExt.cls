public with sharing class SearchEngineExt {

    public Account current{get;set;}
    public list<Account> result{get;set;}
    public boolean show{get;set;}
    public string Range{get;set;}   
    public string RangeAccount{get;set;}   
    public string objectRange{get;set;} 
    
    public string activityRange{get;set;} 
    public string activitystatus{get;set;}  
    public string activitysummarize{get;set;}
    
    public Integer totalrecs{get;set;}
    public list<string> FieldsetObjectList = new list<string>();
           
    public SearchEngineExt(ApexPages.StandardController controller) {
        current=(Account)controller.getRecord(); 
        show=false;  
        Range='THIS_YEAR';
        RangeAccount = 'All';
    }
    
    //Preparing the list of options under Time Frame Section
    public List<SelectOption> getRangeList() {
    list<SelectOption>SelectOptionList = new list<SelectOption>();


            SelectOptionList.add(new SelectOption('THIS_YEAR', 'Current Year'));
            SelectOptionList.add(new SelectOption('LAST_YEAR', 'Previous Year'));                    
            SelectOptionList.add(new SelectOption('NEXT_YEAR', 'Next Year'));            
            SelectOptionList.add(new SelectOption('null', '--------Calendar Quarter----'));            
            SelectOptionList.add(new SelectOption('THIS_QUARTER', 'Current Quarter'));
            SelectOptionList.add(new SelectOption('LAST_QUARTER', 'Previous Quarter'));
            SelectOptionList.add(new SelectOption('NEXT_QUARTER', 'Next Quarter'));            
            SelectOptionList.add(new SelectOption('null', '--------Calendar Month------'));
            SelectOptionList.add(new SelectOption('THIS_MONTH', 'Current Month'));
            SelectOptionList.add(new SelectOption('LAST_MONTH', 'Previous Month'));
            SelectOptionList.add(new SelectOption('NEXT_MONTH', 'Next Month'));            
            SelectOptionList.add(new SelectOption('null', '--------Calendar Week-------'));
            SelectOptionList.add(new SelectOption('THIS_WEEK', 'Current Week'));
            SelectOptionList.add(new SelectOption('LAST_WEEK', 'Previous Week'));
            SelectOptionList.add(new SelectOption('NEXT_WEEK', 'Next Week'));
            SelectOptionList.add(new SelectOption('null', '--------Day----------------------'));                       
            SelectOptionList.add(new SelectOption('TODAY', 'Today'));
            SelectOptionList.add(new SelectOption('YESTERDAY', 'Yesterday'));
            SelectOptionList.add(new SelectOption('TOMORROW', 'Tomorrow'));
            SelectOptionList.add(new SelectOption('LAST_90_DAYS', 'Last 90 Days'));
            SelectOptionList.add(new SelectOption('NEXT_90_DAYS', 'Next 90 Days'));
                     
            return SelectOptionList;
    }
    
    public List<SelectOption>getActivityList() {
    list<SelectOption>SelectActivityList = new list<SelectOption>();
    
            SelectActivityList.add(new SelectOption('Call','Call'));
            SelectActivityList.add(new SelectOption('E-mail','E-mail'));
            SelectActivityList.add(new SelectOption('Meeting','Meeting'));
            return SelectActivityList;
    }  
    
    public List<SelectOption>getActivityStatusList() {
    list<SelectOption>SelectActivityStatusList = new list<selectOption>();
    
            SelectActivityStatusList.add(new SelectOption('Not Started','Not Started'));
            SelectActivityStatusList.add(new SelectOption('In Progress','In Progress'));
            SelectActivityStatusList.add(new SelectOption('Completed','Completed'));
            
            return SelectActivityStatusList;
    
    }
    
    public List<SelectOption>getActivitySummarizeList() {
    list<SelectOption>SelectActivitySummarizeList = new list<selectOption>();
    
            SelectActivitySummarizeList.add(new SelectOption('TODAY', 'Today'));
            SelectActivitySummarizeList.add(new SelectOption('YESTERDAY', 'Yesterday'));
            SelectActivitySummarizeList.add(new SelectOption('THIS_WEEK', 'Current Week'));         
            SelectActivitySummarizeList.add(new SelectOption('LAST_WEEK', 'Previous Week')); 
            SelectActivitySummarizeList.add(new SelectOption('THIS_MONTH', 'Current Month'));
            SelectActivitySummarizeList.add(new SelectOption('LAST_MONTH', 'Previous Month'));
            SelectActivitySummarizeList.add(new SelectOption('THIS_YEAR', 'Current Year'));
            SelectActivitySummarizeList.add(new SelectOption('LAST_YEAR', 'Previous Year')); 
            SelectActivitySummarizeList.add(new SelectOption('THIS_QUARTER', 'Current Quarter'));
            SelectActivitySummarizeList.add(new SelectOption('LAST_QUARTER', 'Previous Quarter'));
            SelectActivitySummarizeList.add(new SelectOption('LAST_90_DAYS', 'Last 90 Days'));
            return SelectActivitySummarizeList;
    
    }
    
    public List<SelectOption> getaccountlist(){
    list<SelectOption>Selectaccountlist = new list<SelectOption>();
    
    Selectaccountlist.add(new SelectOption('All','All'));
    Selectaccountlist.add(new SelectOption('Selected','Selected'));
    
    return Selectaccountlist;
    }
    
    public List<SelectOption> getFieldsetObjectList(){
    list<SelectOption>Selectobjectlist = new list<SelectOption>();
    
    for(Schema.FieldSetMember fl: Schema.SObjectType.Search_Object__c.fieldSets.getMap().get('Total').getFields()){
                    Selectobjectlist.add(new SelectOption(fl.getLabel() , fl.getLabel() )); 
                    FieldsetObjectList.add(fl.getLabel());
                } 
    
    return Selectobjectlist;
    }
    

    public void search() {
    
    string sqlquery= 'Select id,name,OwnerId,Type,Account_Owner_lookup__c,Account_Lookup__c,Opp_Count__c';
    
    sqlquery +=  ' from Account where IsDeleted = false ';
    
    if(current.Account_Lookup__c <> null && RangeAccount == 'Selected'){
             sqlquery += ' AND Id = \''+ current.Account_Lookup__c+'\'';
    }
    else{  
    if(RangeAccount == 'All' && current.Account_Owner_lookup__c <> null) {
            sqlquery += 'AND OwnerId = \''+ current.Account_Owner_lookup__c  +'\'';
    }
    if((Range <> null) ) {
            sqlQuery += ' AND CreatedDate = '+ Range;             
    }   
    }
    
    result = database.query(sqlquery);
    totalrecs=result.size();
    
    if(result.isempty()==false){
        show=true;
    }else{
        show=false;
    }
  }
}
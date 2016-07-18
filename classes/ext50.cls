public with sharing class ext50 {
public list<test__c> testlist{get;set;}
public string searchText{get;set;}
public test__c current{get;set;}
public boolean abc{get;set;}
    
    public ext50(ApexPages.StandardController controller) {
        //testlist = [select id,name,First_Name__c,Last_Name__c,Amount__c from test__c];  
        current =  (test__c)controller.getRecord(); 
        abc= false;
    }
    
    public void search(){
        testlist = [select id,name,First_Name__c,Last_Name__c,Amount__c from test__c where First_Name__c LIKE : '%' + searchText + '%']; 
    abc = true;
    }
    public void show(){
    abc = true;
    }
}
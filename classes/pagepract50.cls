public with sharing class pagepract50 {
    public list<test__c> searchlist{get;set;}
    public string searchtext{get;set;}
    public pagepract50(ApexPages.StandardController controller) {

    }
    
    public void search(){
        searchlist=[select id,name,First_Name__c,Last_Name__c,Full_Name__c,Amount__c,CloudComputing__c,Status__c from test__c where First_Name__c LIKE : '%' + searchtext + '%' ];
    } 
}
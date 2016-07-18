public class cont6 {
    public list<Laboratory__c> lab =new list<Laboratory__c>();
    public list<OPD__c>opdlab = new list<OPD__c>();
    
    public list<Laboratory__c> getValues() {
    
        lab =[select Department__c,IPD_Patient_Name__c, IPD_Patient_Age__c,IPD_Patient_Mother_Name__c,IPD_Patient_Father_Name__c from Laboratory__c ];
        return lab;
    }

    public list<OPD__c> getValues1() {
    
        opdlab=[select Name__c,Age__c,Email__c,Address__c from OPD__c];
        return opdlab;
    }
}
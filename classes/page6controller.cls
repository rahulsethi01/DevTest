public with sharing class page6controller {
    public list<Iphone__c>iphn = new list<Iphone__c>();

    public list<Iphone__c> getvalues()
    {
    iphn=[select Iphone_Name__c,Iphone_Price__c,Total_Records__c from Iphone__c];
    return iphn;
    }

}
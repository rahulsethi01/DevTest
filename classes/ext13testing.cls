public class ext13testing {

public Drug__c current {get;set;}

     public ext13testing(ApexPages.StandardController controller) {
     current=(Drug__c)controller.getRecord();
    }

public list <Patient_Drug__c> result = new list<Patient_Drug__c>(); 

public list<Patient_Drug__c> getsearch()
{
result=[select id,Name__c from Patient_Drug__c where id=:current.CenterAcroynm11__c];
return result;
}
}
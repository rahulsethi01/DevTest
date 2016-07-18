public class ext29testing {

  public list<Laboratory__c> result{get;set;}
  public ext29testing(ApexPages.StandardController controller) {
    }
public list<Laboratory__c> getdata3()
{    
result=[select  IPD_Patient_Name__c,IPD_Patient_Age__c,IPD_Patient_Father_Name__c from Laboratory__c];   
return result;
}
}
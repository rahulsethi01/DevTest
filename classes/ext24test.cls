public class ext24test {

    public list<CloudComputing__c> result{get;set;} 
    public string value;
    public ext24test(ApexPages.StandardController controller) {
   
    }

public list<CloudComputing__c> getdata()
{
result=[select CRM_Name__c,Configuration__c,Charges__c,Plan__c from CloudComputing__c];
return result;
}

public void updatedata() {
    update result; 
    }
}
public class ext30 {

    public list<Laboratory__c> result{get;set;}
    public ext30(ApexPages.StandardController controller) {

    }
    
    public list<Laboratory__c> getvalue3()
    {
    result=[select IPD_Patient_Name__c,IPD_Patient_Father_Name__c,IPD_Patient_Age__c from Laboratory__c];
    return result;
    }

}
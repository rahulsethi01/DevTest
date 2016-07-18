public class ext7 {

    public ext7(ApexPages.StandardController controller) {

    }

public list<Laboratory__c> lab =new list<Laboratory__c>();

    public list<Laboratory__c> getValues() {
    lab =[select IPD_Patient_Name__c, IPD_Patient_Age__c,IPD_Patient_Mother_Name__c,IPD_Patient_Father_Name__c from Laboratory__c ];
return lab;
}
}
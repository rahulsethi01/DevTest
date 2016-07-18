public class ext13 {
 
    public Drug__c current{get;set;}
    public string a1{get;set;}
    public Decimal a2{get;set;}
    public string a3{get;set;}
    public list<Patient_Drug__c> result = new list<Patient_Drug__c>();
    
    Map<Integer, Patient_Drug__c> mapToAccount = new Map<Integer, Patient_Drug__c>();
    
    public ext13(ApexPages.StandardController controller)
    {
     current=(Drug__c)controller.getRecord();
    }
    public void search()
    {
    result=[SELECT id,Name__c,Age__c,Address__c FROM Patient_Drug__c where id=:current.CenterAcroynm11__c ];
    a1=result[0].Name__c;
    a2=result[0].Age__c;
    a3=result[0].Address__c;
   // return result ;
    } 
    
    public Map<Integer,Patient_Drug__c> getMapToAccount() {
    return mapToAccount;
    }

}
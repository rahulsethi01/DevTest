public class ext8 {
       
    public InfraDetails__c current {get;set;}
    ApexPages.StandardController contro;   
    public ext8(ApexPages.StandardController controller) {
    contro=controller;
    current=(InfraDetails__c)controller.getRecord(); 
    }
    
    
public list<InfraDetails__c> infra =new list<InfraDetails__c>();
   
   public list<InfraDetails__c> getvalues() {
   
   infra=[select Block__c,Facility__c,Room__c from InfraDetails__c where Block__c = 'A' ];
   return infra;
   }
   
public list<InfraDetails__c> getvalues1() {
   
   infra=[select Block__c,Facility__c,Room__c from InfraDetails__c where Block__c = 'B' ];
   return infra;
   }
   
public list<InfraDetails__c> getvalues2() {
   
   infra=[select Block__c,Facility__c,Room__c from InfraDetails__c where Block__c = 'C' ];
   return infra;
   }
   
public void doSearch() {
        
      infra=[select Block__c,Facility__c,Room__c from InfraDetails__c where Block__c = 'C' ];
  // return infra;
    }   
}
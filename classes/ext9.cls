public class ext9 {
    
    public List<InfraDetails__c> results{get;set;}
public boolean sho{get;set;}    
    public InfraDetails__c current{get;set;}
    
    public ext9(ApexPages.StandardController controller) {
    current=(InfraDetails__c)controller.getRecord();
    sho=false;
    }
    

public void doSearch() {


results=[select Block__c,Facility__c,Room__c from InfraDetails__c where Block__c =: current.Block__c AND Facility__c LIKE :'%'+current.Facility__c+'%'];
if(results.isempty()==false){
sho=true;
}else{
sho=false;
}
    } 
}
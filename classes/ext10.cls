public class ext10 {

    
public list<InfraDetails__c> result {get;set;}
    
    public InfraDetails__c current{get;set;}
    
    public boolean show{get;set;}
    
    public ext10(ApexPages.StandardController controller) {
    
    result=new list<InfraDetails__c>();
    current=(InfraDetails__c)controller.getRecord();
    show=false;
    }
    
public void dosearch()
{
result=[select Block__c,Facility__c,Room__c from InfraDetails__c where Block__c =: current.Block__c AND Facility__c LIKE : '%'+ current.Facility__c +'%'];
if(result.isempty()==false){
show=true;
}else{
show=false;
}
}
}
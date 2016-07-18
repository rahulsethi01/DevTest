public class ext13test {

    public list<IPD__c>result{get;set;}
    public Medicine_Issued__c current{get;set;}
    public Boolean show{get;set;}
    
    public ext13test(ApexPages.StandardController controller) {
    current=(Medicine_Issued__c)controller.getRecord();
    show=false;
    }
    
    public void change()
    {
    show=true;
    result=[select id,Name__c,Age__c,Email__c,Address__c from IPD__c where id=:current.IPDs__c]; 
    system.debug('==================result============'+result);
 
    for(IPD__c ca:result)
    {
    current.Name__c=ca.Name__c;
    current.Age__c=ca.Age__c;
    current.Email__c=ca.Email__c;
    current.Address__c=ca.Address__c;
    }
    }
}
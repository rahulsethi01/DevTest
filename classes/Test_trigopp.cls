@isTest
public class Test_trigopp 
{    
    static testMethod void verify_Trigger(){
    
    Opportunity dummyopp = new Opportunity();
    dummyopp.name='test';
    dummyopp.CloseDate=system.today();
    dummyopp.StageName='Prospecting';
    dummyopp.Stage_dup__c='Qualification';
 
    insert dummyopp;
    }
}
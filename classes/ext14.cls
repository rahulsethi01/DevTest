public class ext14 {

    public ext14(ApexPages.StandardController controller) {
    current=(test__c)controller.getRecord();
    }
public list<test__c> result = new list<test__c>();
public list<test__c> result1 = new list<test__c>();

public test__c current{get;set;}

public list<test__c> getshow()
{
result=[select First_Name__c,Last_Name__c from test__c ];
return result;
}
public list<test__c> edit1()
{
result1=[select First_Name__c,Last_Name__c from test__c];
return result1;
}

public void showfor()
{
result1=[select First_Name__c from test__c];
for(test__c ab:result)
{
ab.First_Name__c='Arjun';
}
update result;
}

}
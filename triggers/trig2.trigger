trigger trig2 on test__c (after update) 
{
public list<test1__c>st = new list<test1__c>();
for(test__c obj:trigger.new)
{
test1__c obj1=new test1__c();
obj1.First_name__c=obj.Full_Name__c;
st.add(obj1);
}
insert st;
}
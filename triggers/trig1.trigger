trigger trig1 on test__c (before insert) 
{
public list<test1__c>stc = new list<test1__c>();
for(test__c s:trigger.new)
{
test1__c st = new test1__c();
st.First_name__c=s.First_Name__c;
stc.add(st);
}

insert stc;
}
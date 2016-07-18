public class test21vf {

    public list<CloudComputing__c> add1{get;set;}
    public Integer count{get;set;}
    public Integer val{get;set;}
    public Integer val1{get;set;}
    public Integer i;
    public test21vf(ApexPages.StandardController controller) {
    count=0;
    add1=new list<CloudComputing__c>();        
    }

public void addrow()
{
count=add1.size()+1;  
CloudComputing__c counterlist=new CloudComputing__c();
counterlist.counter__c=count;
//add1.add(new CloudComputing__c());
add1.add(counterlist);
}

public void save()
{
insert add1;
}

public void delrow()
{
val1=integer.valueof(val);
add1.remove(val1-1);

i=1;
for(CloudComputing__c objn:add1)
{
objn.counter__c=i;
i=i+1;
}
}
}
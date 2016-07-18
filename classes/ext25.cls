public class ext25 {

    public list<CloudComputing__c> add1{get;set;}
    public Integer count{get;set;}
    public Integer valu{get;set;}
    public Integer valu1{get;set;}
    public Integer i;
    public ext25(ApexPages.StandardController controller) {
    count=0;
    add1=new list<CloudComputing__c>();
    
    }
    
public void addrow()
{
count=add1.size()+1;
CloudComputing__c counterlist = new CloudComputing__c();
counterlist.counter__c=count;
add1.add(counterlist);
}

public void delrow()
{
valu1=integer.valueof(valu);
add1.remove(valu1-1);
i=1;
for(CloudComputing__c az:add1)
{
az.counter__c=i;
i=i+1;
}
}

public void save()
{
insert add1;
}
}
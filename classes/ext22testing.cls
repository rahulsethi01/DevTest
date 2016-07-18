public class ext22testing {

    public list<CloudComputing__c> addition{get;set;}
    public Integer val{get;set;}
    public Integer val1{get;set;}
    public Integer count{get;set;}
    public Integer i;
    public ext22testing(ApexPages.StandardController controller) {
    count=0; 
    addition=new list<CloudComputing__c>(); 
    }
  
    public void addrow(){
    count=addition.size()+1;
    CloudComputing__c counterlist=new CloudComputing__c();
    counterlist.counter__c = count;
    addition.add(counterlist);
    }

    public void delrow()
    {
    val1=integer.valueof(val);
    addition.remove(val1-1);
    i=1;
    for(CloudComputing__c obj:addition)
    {
    obj.counter__c=i;
    i=i+1;
    }
    }

}
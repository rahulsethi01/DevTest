public class ext22 {

    public list<CloudComputing__c> addlist {get;set;}
    public list<CloudComputing__c> add1 {get;set;}
    public list<CloudComputing__c> resultdel {get;set;}
     public Integer count {get;set;}
      public Integer rowNum{get;set;}
       public Integer i;
    public CloudComputing__c current {get; set;}
    public Integer val {get;set;}
    public integer val1{get;set;}
    
    public ext22(ApexPages.StandardController controller) {
     count=0;                                                        //intializing counter
     current=(CloudComputing__c)controller.getRecord();
     addlist=[select CRM_Name__c,Configuration__c,Plan__c,Charges__c from CloudComputing__c ];
     add1= new list<CloudComputing__c>();
        }

public void addRow()
{
count=add1.size()+1;                                                 //incrementing counter
CloudComputing__c counterlist =new CloudComputing__c();             //creating an instance 
counterlist.counter__c=count;
add1.add(counterlist);
//add1.add(new CloudComputing__c());                                //simply adding without instance
}


public void Save()
{
insert add1;
}

public void deleteRow()
{
//resultdel = [select CRM_Name__c,Configuration__c,Plan__c,Charges__c from CloudComputing__c where   ];
val1=integer.valueof(val);
add1.remove(val1-1);
i=1;
for(CloudComputing__c ab:add1)
{
ab.counter__c=i;
i=i+1;
}
}

 }
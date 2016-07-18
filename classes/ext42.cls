public with sharing class ext42 {

    public list<Woodland__c>addlist {get;set;}
    public Integer count{get;set;}
    public Woodland__c current{get;set;}
    public Integer Val{get;set;}
    public Integer Val1{get;set;}
    
    public ext42(ApexPages.StandardController controller) {
        count = 0;
        current = (Woodland__c)controller.getRecord();
        addlist = new list<Woodland__c>();
    }
      
    public void addRow(){
        count = count + 1;
        Woodland__c counterlist = new Woodland__c();
        counterlist.counter__c=count;
        addlist.add(counterlist);
        system.debug('======addlist on Insert======='+addlist);
    }
   
    public void Save(){
        insert addlist;
        system.debug('======addlist======='+addlist);
    }
    
    public void deleteRow(){
        val1 = integer.valueof(val);
        addlist.remove(val1-1);
        system.debug('======addlist on Delete======='+addlist);
    }
  
}
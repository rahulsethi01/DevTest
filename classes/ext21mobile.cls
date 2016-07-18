public class ext21mobile{

    public list<CloudComputing__c> addlist {get;set;}
    public list<CloudComputing__c> add1 {get;set;}
    public list<CloudComputing__c> resultdel = new list<CloudComputing__c>();
    public Integer count {get;set;}
    public CloudComputing__c current {get; set;}
    public Integer val {get;set;}
    public integer val1{get;set;}
    public boolean boolcheck{get;set;}
    
    public ext21mobile(ApexPages.StandardController controller) {
                                                    //intializing counter
        current=(CloudComputing__c)controller.getRecord();
     
        addlist = [select id,name,counter__c,CRM_Name__c,Configuration__c,Plan__c,Charges__c from CloudComputing__c order by counter__c];
        if(addlist.isempty() == false){
            boolcheck = true;
        }
        count   = addlist.size();
    //  add1= new list<CloudComputing__c>();
    }

    public void addRow(){
        try{
            boolcheck = true;
            count=count+1;                                                     //incrementing counter
            CloudComputing__c counterlist =new CloudComputing__c();            //creating an instance 
            counterlist.counter__c=count;
            addlist.add(counterlist);
            //add1.add(new CloudComputing__c());                               //simply adding without instance
            }catch(Exception e){
                system.debug('===========Exception========'+e);
            }
    }


    public void Save(){
        try{
            upsert addlist;
            delete resultdel;
        }catch(Exception e){
            system.debug('==========Exception=========='+e);
        }    
    }
    
    public void deleteRow(){
      try{  
            count = count - 1;
            val1=integer.valueof(val);
            
            if(addlist[val1 - 1].id <> null){
                resultdel.add(addlist[val1 - 1]);
            }
             
            addlist.remove(val1 - 1);
             
            for(integer i=val1-1;i<=addlist.size()-1;i++){
                addlist[i].counter__c = addlist[i].counter__c - 1;        
            }
         }catch(Exception e){
         system.debug('=========Exception========='+e);
         }   
    }
 }
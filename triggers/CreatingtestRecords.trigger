trigger CreatingtestRecords on CloudComputing__c (after insert,after update) {
public set<Id>cloudcomputingset = new set<Id>();     
public list<test__c> testlist = new list<test__c>();
public Map<Id,test__c> cloudmap = new Map<Id,test__c>();
    
    system.debug('=======triggernew========'+trigger.new);
    for(CloudComputing__c cobj:trigger.new){
        cloudcomputingset.add(cobj.id);
    }
    
    system.debug('==========cloudcomputingset========'+cloudcomputingset);
    
    testlist = [select id,name,Amount__c,First_Name__c,Last_Name__c,Full_Name__c,CloudComputing__c from test__c where CloudComputing__c in:cloudcomputingset];
    
    system.debug('==========testlist========'+testlist);
    
    for(test__c tesobj:testlist){
        cloudmap.put(tesobj.CloudComputing__c,tesobj);
    }
    
    system.debug('==========cloudmap========'+cloudmap);
    
    for(CloudComputing__c cobj: trigger.new){
        test__c  tobj;
        if(!cloudmap.ContainsKey(cobj.id)){
            tobj = new test__c();
            tobj.CloudComputing__c   = cobj.id;
            tobj.First_Name__c = 'test777';
            tobj.Amount__c     =  cobj.Charges__c;
            
        }else{
            tobj = cloudmap.get(cobj.id);
            //tobj.id            = cobj.id;
            tobj.First_Name__c = 'test888';
            tobj.Amount__c     =  cobj.Charges__c;
        }
            cloudmap.put(tobj.CloudComputing__c,tobj);
    }   
    
    if(cloudmap.values().isempty() == false){
        upsert cloudmap.values();
    }
    system.debug('==========cloudmap========'+cloudmap);
}
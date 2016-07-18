trigger generatingAutoNumber on Woodland__c (after insert) {
list<Woodland__c> woodlandlist = new list<Woodland__c>();
Integer woodlandjacketcount;
Integer woodlandfootwearscount;
Integer woodlandwoodiescount;

woodlandlist = [select id,Type__c,name from Woodland__c];  

woodlandjacketcount    = [select count() from Woodland__c where Type__c = 'Jackets']; 
woodlandfootwearscount = [select count() from Woodland__c where Type__c = 'Footwears']; 
woodlandwoodiescount   = [select count() from Woodland__c where Type__c = 'Woodies']; 

if(woodlandjacketcount == NULL) { woodlandjacketcount    = 0; }
if(woodlandjacketcount == NULL) { woodlandfootwearscount = 0; }
if(woodlandjacketcount == NULL) { woodlandwoodiescount   = 0; }

    for(Woodland__c obj:woodlandlist){  
        if(obj.Type__c == 'Jackets'){
            obj.Woodland_NewCode__c = obj.Type__c + '-' + woodlandjacketcount; 
        }
         if(obj.Type__c ==  'Footwears'){
            obj.Woodland_NewCode__c = obj.Type__c + '-' + woodlandfootwearscount; 
        }
         if(obj.Type__c == 'Woodies'){
            obj.Woodland_NewCode__c = obj.Type__c + '-' + woodlandwoodiescount; 
        }
    } 
    if(woodlandlist.isempty() == false){
        update woodlandlist;
    }
}
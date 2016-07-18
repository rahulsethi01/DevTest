public with sharing class offsetextension {

    public integer totalPageOnVF{get;set;}
    public integer PageNoOnVF{get;set;}
    public Integer pageNumber{set;get;}
    public Integer totalPage{get;set;}
    public integer indexOnVF{get;set;}
    
    public integer pageremainder{get;set;}
    public integer newpageno {get;set;}
    public integer totalRecs{get;set;}   
    public integer index{get;set;}
    public integer blockSize{get;set;} 
    public integer pageno{get;set;}  
    public boolean first = true;
          
    Map<id,string> BeforeCancel = new Map<id,string>(); 
    Map<id,string> BeforeCancel1 = new Map<id,string>(); 
    Map<id,string> BeforeCancel2 = new Map<id,string>(); 
    
    public list<Insurance__c> result = new list<Insurance__c>();
    public list<Insurance__c> resultlistnew = new list<Insurance__c>();
    public list<Insurance__c> tempresult = new list<Insurance__c>();
    
    Map<id,Insurance__c> BeforeCancelResultList = new Map<id,Insurance__c>();      
          
    public offsetextension(ApexPages.StandardController controller) {
  
        blockSize = 4;
        index=0;
        pageno = index + blockSize;
        totalRecs = 0;
        pageNumber=1;
       
    }
    
     public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('4','4'));
        options.add(new SelectOption('10','10'));
        options.add(new SelectOption('20','20'));
        options.add(new SelectOption('50','50'));
        options.add(new SelectOption('100','100'));
        return options;
    }
    

    public list<Insurance__c> getshow() {
  
     totalRecs = [select count() from Insurance__c];  
     if(totalRecs <> 0 && totalRecs <> null){
             totalPageOnVF = totalRecs; 
             totalPage = (totalRecs/blockSize)+1;
             }       
        indexOnVF = index+1;
        
        resultlistnew=[select id,Ins_Policy_Name__c,Insurance_Number__c,status__c,City__c,State__c from Insurance__c];
                 
                 if(index>2000){
                     list<Insurance__c> dummylist=resultlistnew;
                     set<id> dummyset=new set<id>();
                      integer count=0;
                    
                    for(integer i=0;i<dummylist.size();i++){
                        if(i>=index){
                        dummyset.add(dummylist[i].id);
                        count++;
                        } 
                        if(count==blockSize)
                        {
                        break;
                        }
                         } 
                        
        result=[select id,Ins_Policy_Name__c,Insurance_Number__c,status__c,City__c,State__c from Insurance__c where id IN: dummyset];            
                        }
              else {          
        result=[select id,Ins_Policy_Name__c,Insurance_Number__c,status__c,City__c,State__c from Insurance__c order by Ins_Policy_Name__c asc LIMIT :blockSize OFFSET :index];
        }
        
        if(first){
            tempresult.addall(result);
            first = false;
           /***** for(Insurance__c insobj : tempresult){                  
                BeforeCancel.put(insobj.id,insobj.State__c);
                BeforeCancel1.put(insobj.id,insobj.City__c);
                BeforeCancel2.put(insobj.id,insobj.status__c);
             }*****/
             
             for(Insurance__c insobj : tempresult){                  
                BeforeCancelResultList.put(insobj.id,insobj);
                }
        }         
        return result;
        
    }
    
    public pageReference save(){

    update result;
     
    PageReference home = new PageReference('/apex/offsetissue' );
           home.setRedirect(true);        
           return home; 
    }
    
 
    
    public pageReference cancel(){

        /***** for(Insurance__c inslist: tempresult){
             inslist.State__c     = BeforeCancel.get(inslist.id);
             inslist.City__c      = BeforeCancel1.get(inslist.id);
             inslist.status__c    = BeforeCancel2.get(inslist.id);
         } *****/
         
         
         for(Insurance__c inslist: tempresult){
             inslist.State__c     = BeforeCancelResultList.get(inslist.id).State__c;
             inslist.City__c      = BeforeCancelResultList.get(inslist.id).City__c;
             inslist.status__c    = BeforeCancelResultList.get(inslist.id).status__c;
         }
         
         
         update tempresult;
             
    PageReference home = new PageReference('/apex/offsetissue' );
           home.setRedirect(true);        
           return home; 
    }
 
   public void beginning()
    {
    
    index = 0;
      pageremainder = index + blockSize ;
      if( pageremainder > blockSize ){
          pageno=blockSize; 
      }
      else{
          pageno=pageremainder;
      }
     
      pageNumber=1;
      indexOnVF = index+1;
      getshow();
      save();
      getshow();
    }
   
    public void previous()
    {
       
       
        pageremainder = math.mod(pageno,blockSize);
        if(pageremainder!=0)
        {

          pageno  = pageno - pageremainder ;
        }
        else {
                pageno = pageno - blockSize ;
         }
         index = index - blockSize;
         pageNumber=pageNumber-1;
         indexOnVF = index+1;
         save();
         getshow();
    }
   
    public void next()
    {
        
            index  =  index + blockSize;
           
            pageno = index + blockSize ;
             if(pageno > totalPageOnVF){
             pageno=totalPageOnVF;
             }
             pageNumber=pageNumber+1;  
             indexOnVF = index+1;
             save();
             getshow();
    }

    public void end()
    {
        index = totalrecs - math.mod(totalRecs,blockSize);
        
        pageno = index + blockSize ;
             if(pageno > totalPageOnVF){
             pageno=totalPageOnVF;
             }
           pageNumber=totalPage;
           indexOnVF = index+1;
           save();
           getshow();
    }        
   
    public boolean getprev()
    {
        if(index == 0) {
        return true;
        }
        else {
        return false; }
    } 
   
    public boolean getnxt(){
        if(((index + blockSize) ) > totalRecs) {
        return true;
        }
        else {
        return false;
        }
    }   
    
    public Integer getrecords(){
       decimal page = totalRecs/blocksize;
       page = page + 1;
       return (Integer)page.round(System.RoundingMode.CEILING);
    }   
      
    public Integer getPageNumber(){
        return index/blocksize + 1;
    } 
    
    public void changeLimit(){
 
       pageNumber=1;
       index= 0;

       getshow();
          
         if(blockSize>totalrecs){
         pageno = index + totalrecs+1;
         }else{
         pageno = index + blockSize;
         } 
    } 
 }
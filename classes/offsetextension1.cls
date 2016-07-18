public with sharing class offsetextension1 {

    public integer totalPageOnVF{get;set;}
    public integer PageNoOnVF{get;set;}
    public Integer pageNumber{set;get;}
    public Integer totalPage{get;set;}
    public integer indexOnVF{get;set;}
    
    public integer pageremainder{get;set;}
    public integer newpageno {get;set;}
    public integer totalRecs{get;set;} 
    public integer totalRecsize{get;set;}  
    public integer index{get;set;}
    public integer blockSize{get;set;} 
    public integer pageno{get;set;}  
    public boolean first = true;
    public integer val;
    
    public list<Insurance__c> result = new list<Insurance__c>();
    public list<Insurance__c> result1 = new list<Insurance__c>();
    public list<Insurance__c> templist = new list<Insurance__c>();
         
          
    public offsetextension1(ApexPages.StandardController controller) {
  
        blockSize = 4;
        index=0;
        pageno = index + blockSize;
        totalRecs = 0;
        pageNumber=1;
        getshow();
    }
    
    

    public list<Insurance__c> getshow() {
  
     totalRecs = [select count() from Insurance__c];  
  /*********************** Pagination ****************************/              
          totalRecsize = [select id,Ins_Policy_Name__c,Insurance_Number__c,status__c,City__c,State__c from Insurance__c].size(); 
          system.debug('=======================totalRecs============================='+totalRecs);
          
          system.debug('=======================totalRecs After  Minus 1============================='+totalRecs);
             if(totalRecs <> 0 && totalRecs <> null){
             totalPageOnVF = totalRecs; 
             totalPage = (totalRecs/blockSize);
             
             if(Math.Mod(totalRecs,blockSize) <> 0){
                 totalPage  = totalPage  + 1;
             }
             } 
             
             
             
             if(blockSize>totalrecs){
             if(totalRecs == 0 && totalRecsize <> 0){
             pageno = 1;
             totalPage = 1;
             }else{
              pageno = index + totalRecs;
             }
             }else{
             pageno = index + blockSize;
             }   
             system.debug('=======================pageno============================='+pageno);
          indexOnVF = index+1;
 /****************************************************************************/
        result=[select id,Ins_Policy_Name__c,Insurance_Number__c,status__c,City__c,State__c from Insurance__c order by Ins_Policy_Name__c asc];
     
        system.debug('==========================Get Show Result============================='+result);
        
        system.debug('==========================index============================='+index);
        
        return result;
        
    }
    
       //Method to return StudentList
    public List<Insurance__c> getStudentList(){
              result1.clear();
              if(index<0)
              index=1;
              templist=result;
              
              system.debug('==========================Initial templist value============================='+templist);
               
              val=0;
              for(integer i=0;i<templist.size();i++){
                      if(i>=index){
                           result1.add(templist[i]);
                           val++;
                      } 
                      if(val==blockSize){
                            break;
                      }
              } 
               system.debug('==========================index============================='+index);
               
              system.debug('==========================Final templist value============================='+templist);
              
              system.debug('==========================StudentList Result1============================='+result1);
              return result1;
    }//End of Method
    
    public pageReference save(){

    update templist;
     
    PageReference home = new PageReference('/apex/offsetissue1' );
           home.setRedirect(true);        
           return home; 
    }
    

    public pageReference cancel(){
             
    PageReference home = new PageReference('/apex/offsetissue1' );
           home.setRedirect(true);        
           return home; 
    }
 
    /******************pagination functions ***********************/
     
      public void beginning(){    
     try{
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
       }Catch(Exception e){
              ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Ooops! There is some problem'));
            system.debug('========excep========================'+e);
        }  
    }
   
    public void previous(){
        try{

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
         }Catch(Exception e){
              ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Ooops! There is some problem'));
            system.debug('========excep========================'+e);
        }
    }
   
    public void next()
    {
        try{
            index  =  index + blockSize;
           
            pageno = index + blockSize ;
             if(pageno > totalPageOnVF){
             pageno=totalPageOnVF;
             }
             pageNumber=pageNumber+1;  
             indexOnVF = index+1;
         }Catch(Exception e){
              ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Ooops! There is some problem'));
            system.debug('========excep========================'+e);
        }
    }

    public void end(){      
        try{   
             index = totalrecs - math.mod(totalRecs,blockSize);
              
              if(math.mod(totalRecs,blockSize) == 0){
                 index = index - blockSize;
               }
                              
                pageno = index + blockSize ;
                 if(pageno > totalPageOnVF){
                     pageno=totalPageOnVF;
                 }
                 pageNumber=totalPage;
                indexOnVF = index+1;
         }Catch(Exception e){
              ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Ooops! There is some problem'));
            system.debug('========excep========================'+e);
        }
    }        
   
    public boolean getprev(){
     boolean TempFlag;
      try{
      
        if(index == 0) {
            TempFlag = true;
        }
        else {
            TempFlag = false;
         }
       }Catch(Exception e){
              ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Ooops! There is some problem'));
               return null; 
            system.debug('========excep========================'+e);
       } 
        return TempFlag;
    } 
   
    public boolean getnxt(){
        boolean TempNFlag;
       try{
          
            if(((index + blockSize) ) >= totalRecs) {
                TempNFlag = true;
            }
            else{
               TempNFlag = False;
            }
        }Catch(Exception e){
              ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Ooops! There is some problem'));
              return null; 
            system.debug('========excep========================'+e);
        }
         return TempNFlag;   
    }   
    
    public Integer getrecords(){
        integer Tempr;
      try{
           decimal page = totalRecs/blocksize;
           page = page + 1;
           Tempr = (Integer)page.round(System.RoundingMode.CEILING);
          
       }Catch(Exception e){
              ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Ooops! There is some problem'));
                  return null; 
            system.debug('========excep========================'+e);
        } 
         return Tempr;
    }   
      
    public Integer getPageNumber(){
        integer Temp;
         try{
            Temp = index/blocksize + 1;
         }Catch(Exception e){
              ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Ooops! There is some problem'));
                  return null; 
            system.debug('========excep========================'+e);
          } 
        return Temp;
    } 
    
    public void changeLimit(){
        try{
           pageNumber=1;
           index= 0;
           indexOnVF = index+1;   
         
         if(blockSize>totalrecs){
         pageno = index + totalrecs;
         }else{
         pageno = index + blockSize;
         } 
        }Catch(Exception e){
              ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Ooops! There is some problem'));
            system.debug('========excep========================'+e);
        } 
   
    } 
     
      public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('4','4'));
        options.add(new SelectOption('10','10'));
        options.add(new SelectOption('20','20'));
        options.add(new SelectOption('30','30'));
        options.add(new SelectOption('40','40'));
        options.add(new SelectOption('50','50'));        
        return options;
    }
     /**************************************************************/
 }
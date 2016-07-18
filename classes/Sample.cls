public class Sample
{ 
  
    Integer[] countries = new Integer[]{};
    
    public String val{get;set;}
    public String Description;
    public String option {get;set;}
    public String option1 {get;set;}
    private integer totalRecs = 0;    
    private integer index = 0;
    private integer blockSize = 2;      
    private integer totalRecs1 = 0;    
    private integer index1 = 0;
    private integer blockSize1 = 2;  
    public boolean isdisplay{get;set;}  
    
     public void fetch()
    {          
                      if(option == '2')
                      {
                      blockSize=2;
                      }
                      else if(option == '4')
                      {
                      blockSize=4;
                      } 
                      else if(option == '6')
                      {
                      blockSize=6;
                      }   
                      else if(option == '8')
                      {
                      blockSize=8;
                      }   
                      else if(option == '10')
                      {
                      blockSize=10;
                      }  
     }

 public void fetch1()
    {          
              if(option1 == '2')
              {
              blockSize1=2;
              
              }
              else if(option1 == '4')
              {
              blockSize1=4;
              } 
              else if(option1 == '6')
              {
              blockSize1=6;
              }   
              else if(option1 == '8')
              {
              blockSize1=8;
              }   
              else if(option1 == '10')
              {
              blockSize1=10;
              }  
     }

   
    public sample()
    {
        totalRecs = [select count() from Event]; 
        totalRecs1 = [select count() from Task];      
    }   
    
    public Integer getrecords()
    {
       decimal page = totalRecs/blocksize;
       return (Integer)page.round(System.RoundingMode.CEILING);
    }
   
    public List<Event> getMemb()
    {
            List<Event> membs =[SELECT id,Subject,What.name,Description,ActivityDate,Owner.Name,StartDateTime,EndDateTime,Show_no_of_pages__c FROM Event  LIMIT :blockSize OFFSET :index ];
        return membs;
    }  
 
    
     public List<Task> getMemb1()
    {
        List<Task> membs1 =[SELECT Subject,Who.name,What.name,Description,ActivityDate,Owner.Name,status,priority FROM Task LIMIT :blockSize1 OFFSET :index1];
        return membs1;
    } 
   
    public void beginning()
    {
        index = 0;
    }
    
    public void beginning1()
    {
        index1 = 0;
    }
   
    public void previous()
    {
        index = index - blockSize;
    }
    
    public void previous1()
    {
        index1 = index1 - blockSize1;
    }
   
    public void next()
    {
        index = index + blockSize;
    }
    
     public void next1()
    {
        index1 = index1 + blockSize1;
    }

    public void end()
    {
        index = totalrecs - math.mod(totalRecs,blockSize);
    }    
    
     public void end1()
    {
        index1 = totalrecs1 - math.mod(totalRecs1,blockSize1);
    }   
   
    public boolean getprev()
    {
        if(index == 0)
        return true;
        else
        return false;
    } 
     public boolean getprev1()
    {
        if(index1 == 0)
        return true;
        else
        return false;
    } 
   
    public boolean getnxt()
    {
        if((index + blockSize) > totalRecs)
        return true;
        else
        return false;
    }  
     public boolean getnxt1()
    {
        if((index1 + blockSize1) > totalRecs1)
        return true;
        else
        return false;
    }     
    public void show()
    {
    isdisplay=true;
    }
}
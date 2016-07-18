public class Sample1
{ 
  String[] countries = new String[]{};
            
        public PageReference test() {
            return null;
        }
            
        public List<SelectOption> getItems() {
            List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('10','10'));
            options.add(new SelectOption('15','15'));
            options.add(new SelectOption('20','20'));
            return options;
        }
            
        public String[] getCountries() {
            return countries;
        }
        
            
        public void setCountries(String[] countries) {
            this.countries = countries;
        }
        
    private integer totalRecs = 0;    
    private integer index = 0;
    private integer blockSize = 5;     
    private integer totalRecs1 = 0;    
    private integer index1 = 0;
    private integer blockSize1 = 5;   
    

   
    public sample1()
    {
        totalRecs = [select count() from Event]; 
        totalRecs1 = [select count() from Task];      
    }   
   
    public List<Event> getMemb()
    {
        List<Event> membs =[SELECT Subject,What.name,Description,ActivityDate,Owner.Name,StartDateTime,EndDateTime,Show_no_of_pages__c FROM Event LIMIT :blockSize OFFSET :index];
        return membs;
    }  
    
    public List<Event> getMemb2()
    {
        List<Event> membs =[SELECT Subject,What.name,Description,ActivityDate,Owner.Name,StartDateTime,EndDateTime,Show_no_of_pages__c FROM Event LIMIT :blockSize OFFSET :index];
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
    
    
        
}
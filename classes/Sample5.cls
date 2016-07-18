public class Sample5
{   
    private integer totalRecs = 0;    
    private integer index = 0;
    private integer blockSize = 5;        

    public Integer getrecords()
    {
       decimal page = totalRecs/blocksize;
       return (Integer)page.round(System.RoundingMode.CEILING);
    }
    public sample5()
    {
        totalRecs = [select count() from Event];       
    }   
   
    public List<Event> getMemb()
    {
        List<Event> membs =[SELECT id,Subject,What.name,Description,ActivityDate,Owner.Name,StartDateTime,EndDateTime,Show_no_of_pages__c FROM Event  LIMIT :blockSize OFFSET :index ];
        return membs;
    }   
   
    public void beginning()
    {
        index = 0;
    }
   
    public void previous()
    {
        index = index - blockSize;
    }
   
    public void next()
    {
        index = index + blockSize;
    }

    public void end()
    {
        index = totalrecs - math.mod(totalRecs,blockSize);
    }       
   
    public boolean getprev()
    {
        if(index == 0)
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
}
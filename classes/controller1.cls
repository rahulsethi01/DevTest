public class controller1 {

public list<Event>result =new list<Event>();
public list<Task>result1 =new list<Task>();

public list<Event> getdata()
{
result=[SELECT Subject,What.name,Description,ActivityDate,Owner.Name,StartDateTime,EndDateTime FROM Event];
 return result;
}

public list<Task> getdata1()
{
result1=[SELECT Subject,Who.name,What.name,Description,ActivityDate,Owner.Name,status,priority FROM Task];
 return result1;
}

 private integer totalRecs = 0;    
    private integer index = 0;
    private integer blockSize = 5;        
   
    public controller1()
    {
        totalRecs = [select count() from Event];       
    }   
   
    public List<Event> getMemb()
    {
        List<Event> membs = Database.Query('SELECT WhoId,subject FROM Event LIMIT :blockSize OFFSET :index');
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
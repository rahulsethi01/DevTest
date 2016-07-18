public class OppUpdation{   
    
    public static void updatingoppamount(Set<Id> OppSet){
        list<Opportunity> Opplist = [select id,name,Amount from Opportunity where id in : OppSet];
    
        for(Opportunity oppobj:Opplist){
            oppobj.Amount=101;    
        }
        
        if(Opplist.isempty() == false){
            update Opplist;
        }
    }
}
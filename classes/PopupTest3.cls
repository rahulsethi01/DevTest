public with sharing class PopupTest3 {    
    public List<Event> getAccounts()  
    {  
        List<Event> accounttList = new List<Event>();  
        accounttList = [Select Id, what.name from Event LIMIT 10];  
        return accounttList ;  
    }  
  
}
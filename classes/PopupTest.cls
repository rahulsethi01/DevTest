public with sharing class PopupTest {    
    public List<Task> getAccounts(){  
        List<Task> accounttList = new List<Task>();  
        accounttList = [Select Id,Description from Task LIMIT 10];  
        return accounttList ;  
    }  
  
}
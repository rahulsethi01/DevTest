public with sharing class MultiselectExampleController {

    public MultiselectExampleController(ApexPages.StandardController controller) {

    }

public SelectOption[] selectedContacts { get; set; } 
     public SelectOption[] allContacts { get; set; } 
      
     public String message { get; set; } 
      
     public MultiselectExampleController() { 
         selectedContacts = new List<SelectOption>(); 
          
         List<Contact> contacts = [SELECT Name, Id FROM Contact];     
         allContacts = new List<SelectOption>(); 
         for ( Contact c : contacts ) { 
             allContacts.add(new SelectOption(c.Id, c.Name)); 
         } 
     } 
 
 
     public PageReference save() { 
    Account accrequest = new Account();
         message = 'Selected Contacts: '; 
         Boolean first = true; 
         for ( SelectOption so : selectedContacts ) { 
             if (!first) { 
                 message += ', '; 
             } 
             //message += so.getLabel() + ' (' + so.getValue() + ')'; 
             message += so.getLabel();
             first = false; 
         } 
         accrequest.name= 'test';
          accrequest.Selected_Users__c = message;
          
         insert accrequest; 
         
         return null;      
     } 

}
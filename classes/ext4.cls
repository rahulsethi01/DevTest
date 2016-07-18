public class ext4 {
    public Office__c current{get;set;}
    ApexPages.StandardController contro;
    public ext4(ApexPages.StandardController controller) 
    {
    contro=controller;
    current=(Office__c)controller.getRecord();
    }
  public PageReference  save(){
 
                 if(current.Date_of_Birth__c  >= current.Date_of_Joining__c) {
                     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAl,'Date of Birth must be less than Date of Joining'));          
                         return null;
                }
              
                if((current.Employee_Name__c == null) || (current.Age__c == null) || (current.Date_of_Joining__c == null) || (current.Date_of_Birth__c == null) || (current.City__c == null) || (current.Age__c == null) || 
                (current.State__c == null) || (current.Street__c == null) || (current.Country__c == null) || (current.Pincode__c == null)) {
                     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAl,'All fields are mandatory'));          
                         return null;
                }
              
                else if (current.Same_As_Permanent_Address__c == FALSE)
                {
                
                }
                
            else
            {
            current.City1__c = current.City__c;
            current.State1__c = current.State__c;
            current.Street1__c = current.Street__c;
            current.Country1__c = current.Country__c;
            current.Pincode1__c = current.Pincode__c;
           current.Full_Address__c= current.City__c+ ' , ' +current.State__c + ',' + current.Street__c + ',' +current.Country__c + ',' +  current.Pincode__c ;
          current.Full_Correspondence_Address__c= current.City1__c+ ' , ' +current.State1__c + ',' + current.Street1__c + ',' +current.Country1__c + ',' +  current.Pincode1__c ;
            contro.save();
            
    }
           PageReference pageRef = new PageReference('/apex/page4vf'); 
                pageRef.setRedirect(true);
                return pageRef ;
    }
}
public class ext2 {
    public Medicine__c current{get;set;}
    ApexPages.StandardController contro;
    public ext2(ApexPages.StandardController controller) 
    {
    contro=controller;
    current=(Medicine__c)controller.getRecord();
    }
  public PageReference  save(){
 
                 if(current.Medicine_Name__c == null) {
                     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAl,'Please Enter the Medicine Name'));          
                         return null;
                }
                else if(current.Expiry_Date__c  <= current.Manufacturing_date__c){
                 ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Expiry date must be greater than Manufacturing date'));          
                         return null;
                }
                 else if(current.Manufacturing_date__c >= system.today() ) {
                 ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Manufacturing date must be less than Today date'));          
                         return null;
                }
                  else if(current.Delivery_date__c <= system.today()) {
                 ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Delivery date must be greater than Today date'));          
                         return null;
                }
            else
            {
           current.Full_name__c= current.FirstName__c+ '' +current.LastName__c ;
            contro.save();
            
    }
           PageReference pageRef = new PageReference('/apex/page2vf'); 
                pageRef.setRedirect(true);
                return pageRef ;
    }
}
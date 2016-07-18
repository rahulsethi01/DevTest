public class ext1 {
public student__c current{get;set;}
ApexPages.StandardController contro;
    public ext1(ApexPages.StandardController controller) {
    contro=controller;
    current=(student__c)controller.getRecord(); 
    }
  
   public PageReference  save(){
 
                 if(current.Father_Name__c == null) {
                     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Please Enter Atleast One Data...'));          
                         return null;
                }
            
            contro.save();
    
           PageReference pageRef = new PageReference('/apex/page1fvf'); 
                pageRef.setRedirect(true);
                return pageRef ;
    }
}
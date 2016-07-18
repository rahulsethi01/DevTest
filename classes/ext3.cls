public class ext3 {
public Drug__c current{get;set;}
  ApexPages.StandardController contro;
  
  public ext3(ApexPages.StandardController controller) {
   contro=controller;
   current=(Drug__c)Controller.getRecord();
    }
    public void save()
    {
   if(current.Drug_Name__c==null)
   {
   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAl,'Please Enter the Drug Name'));          
                         return ;
   }
  // contro.save();
  
  upsert current;
}
}
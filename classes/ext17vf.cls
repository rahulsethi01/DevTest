public class ext17vf {

    public list<Medical_type__c>result  = new list<Medical_type__c>();
    public Medicine_Inventory__c current{get;set;}
    
     public string id{get;set;}
    public boolean show{get;set;}
    public boolean show1{get;set;}
    
    public ext17vf(ApexPages.StandardController controller) {
    
    current=(Medicine_Inventory__c)controller.getRecord();
    //current1=(Medical_type__c)controller.getRecord();
    
    id  = (Id)ApexPages.currentPage().getParameters().get('id');
    
    show=false;
     show1=false;
    }

 public List<SelectOption> getmedoption() {
            List<SelectOption> st = new List<SelectOption>();
            
    result =[select name from Medical_type__c];
    st.add(new selectoption('---select med type--','---select med type--'));
    for(Medical_type__c s:result ){
    st.add(new selectoption(s.name,s.name));
    }
            return st;
        }
        
  public PageReference cancel()
  {
  return new PageReference('https://c.ap1.visual.force.com/apex/page17vf');
   }
   
   public void change(){
   System.debug('=================med_type__c============' +current.med_type__c);
   

if(current.med_type__c == 'Tablet' || current.med_type__c == 'Capsule' )
{
   show=true;
   show1=true;
}
else if(current.med_type__c == 'Antiboitic')
{
show=true;
show1=false;
}
 else
{
  show=false;
  
}    
  
   }
   
   public void save()
   {
   if(current.med_type__c == 'Tablet' || current.med_type__c == 'Capsule' )
{
   current.Remaining_Stock__c=current.No_of_Purchased_Box__c *   current.No_of_Strips_per_Box__c * current.No_of_tablets_in_each_strip__c ;
 }  
  else if(current.med_type__c=='Antiboitic')
   {
   current.Remaining_Stock__c=current.No_of_Purchased_Box__c *   current.No_of_Strips_per_Box__c  ;
          
                         
   }
 
    else if(current.med_type__c=='---select med type--')
   {
   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAl,'Please Enter the Medical type'));          
                         
   }
   
       else if(current.Nomenclature__c==null)
   {
   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAl,'Please Enter the Medical type'));          
                         
   }
       else if(current.Expiry_Date__c==null)
   {
   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAl,'Please Enter the Medical type'));          
                         
   }
   else
   {
   insert current;
   }
     }   
   public PageReference savenew()
  {
   insert current;
  return new PageReference('https://c.ap1.visual.force.com/apex/page17vf');
  
   }
   public PageReference clone1()
  {
  return new PageReference('/'+id+'/e?clone=1');
   } 
  }
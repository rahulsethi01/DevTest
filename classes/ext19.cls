public class ext19 {
    public Boolean displayPopup {get;set;}
    public Boolean show {get;set;}
    public Boolean show1 {get;set;}
    
    public boolean shows{get;set;}
    public boolean shows1{get;set;}
    
public Date expdate{get;set;}

public Decimal remain {get;set;}
public Decimal purc {get;set;}
public Decimal strl {get;set;}
public Decimal tabl {get;set;}

public Integer calcul {get;set;}
public list<Medical_type__c>resultoutput  = new list<Medical_type__c>();
public list<Medicine_Inventory__c> result {get;set;}
public list<Medicine_Inventory__c> result1 {get;set;}
public list<Medicine_Inventory__c> result2 {get;set;}
public list<Medicine_Inventory__c> resdel {get;set;}
public list<Medicine_Inventory__c> searchres {get;set;}
public string name {get;set;}
public string searchvalue{get;set;}
public Medicine_Inventory__c current {get;set;}
public string val {get;set;}

     public ext19(ApexPages.StandardController controller) {
     current=(Medicine_Inventory__c)controller.getRecord();
     show=true;
     show1=false;
     shows=false;
     shows1=false;
     calcul=100;
    }
    
    public List<SelectOption> getmedoption1() {
    List<SelectOption> st1 = new List<SelectOption>();
            
    resultoutput =[select name from Medical_type__c];
    st1.add(new selectoption('---select med type--','---select med type--'));
    
    for(Medical_type__c s:resultoutput ){
    st1.add(new selectoption(s.name,s.name));
    }
          return st1;
    }
    
    
    public list<Medicine_Inventory__c> getdata()
    {
    result=[select Nomenclature__c,No_of_Purchased_Box__c,No_of_Strips_per_Box__c,No_of_tablets_in_each_strip__c,Cost_per_strip__c,Remaining_Stock__c,Expiry_Date__c,Mfg_Date__c,Purchase_Price__c,Purchase_Date__c,Maximum_level__c,Minimum_Level__c,Reorder_Level__c from Medicine_Inventory__c];
    return result;
    }

    public PageReference newval()
    {
    return new PageReference('https://c.ap1.visual.force.com/apex/page17vf');
    }


    public void showPopup(){
        displayPopup = true;
        result1=[select id,No_of_Purchased_Box__c,Remaining_Stock__c,No_of_Strips_per_Box__c,No_of_tablets_in_each_strip__c,Cost_per_strip__c,Nomenclature__c,Expiry_Date__c,Mfg_Date__c,Purchase_Price__c,Purchase_Date__c,Maximum_level__c,Minimum_Level__c,Reorder_Level__c from Medicine_Inventory__c where id=:val];
        System.debug('=================result1 ============' +result1);
    }
    
    public void deletepopup(){
        Medicine_Inventory__c m2=new Medicine_Inventory__c();
        m2.Expiry_Date__c=current.Expiry_Date__c;
        m2.Mfg_Date__c=current.Mfg_Date__c;
        m2.Purchase_Price__c=current.Purchase_Price__c;
        m2.Maximum_level__c=current.Maximum_level__c;
        m2.Reorder_Level__c=current.Reorder_Level__c;    
        delete m2;   
    }
    
    public void closePopup() {
        displayPopup = false;
    }
    
    public PageReference redirectPopup(){
        displayPopup = false;
        return null;
    }
    
     public void updatepopup() {
     result2=[select id,Nomenclature__c,Remaining_Stock__c,No_of_Purchased_Box__c,No_of_Strips_per_Box__c,No_of_tablets_in_each_strip__c,Cost_per_strip__c,Expiry_Date__c,Mfg_Date__c,Purchase_Price__c,Purchase_Date__c,Maximum_level__c,Minimum_Level__c,Reorder_Level__c from Medicine_Inventory__c where id=:val];
 
     Medicine_Inventory__c m1=new Medicine_Inventory__c();
     
     if(current.med_type__c == 'Tablet' || current.med_type__c == 'Capsule' ){
         m1.Remaining_Stock__c=current.No_of_Purchased_Box__c *   current.No_of_Strips_per_Box__c * current.No_of_tablets_in_each_strip__c ;
     }  
     else if(current.med_type__c=='Antiboitic'){
         m1.Remaining_Stock__c=current.No_of_Purchased_Box__c *   current.No_of_Strips_per_Box__c  ;
     }

         m1.Expiry_Date__c=current.Expiry_Date__c;
         m1.Mfg_Date__c=current.Mfg_Date__c;
         m1.Purchase_Price__c=current.Purchase_Price__c;
         m1.Maximum_level__c=current.Maximum_level__c;
         m1.Reorder_Level__c=current.Reorder_Level__c;
          
         m1.No_of_Purchased_Box__c=current.No_of_Purchased_Box__c;
         m1.No_of_Strips_per_Box__c=current.No_of_Strips_per_Box__c;
         m1.No_of_tablets_in_each_strip__c=current.No_of_tablets_in_each_strip__c;
         m1.Cost_per_strip__c=current.Cost_per_strip__c;
         System.debug('============== result2======== '+result2);
         
         for(Medicine_Inventory__c ab:result2){
         remain=ab.Remaining_Stock__c;
         System.debug('============== ab.Remaining_Stock__c======== '+ab.Remaining_Stock__c);
         System.debug('============== remain======== '+remain);
         name=ab.Nomenclature__c;
         ab.Mfg_Date__c=current.Mfg_Date__c;
         ab.Purchase_Price__c=current.Purchase_Price__c;
         ab.Maximum_level__c=current.Maximum_level__c;
         ab.Reorder_Level__c=current.Reorder_Level__c;
             
         ab.No_of_Purchased_Box__c=current.No_of_Purchased_Box__c;
         ab.No_of_Strips_per_Box__c=current.No_of_Strips_per_Box__c;
         ab.No_of_tablets_in_each_strip__c=current.No_of_tablets_in_each_strip__c;
         ab.Cost_per_strip__c=current.Cost_per_strip__c;
          
         expdate = ab.Expiry_Date__c;
         
         purc    = current.No_of_Purchased_Box__c;
         strl    = current.No_of_Strips_per_Box__c;
         tabl    = current.No_of_tablets_in_each_strip__c;
           
 
          if(current.med_type__c == 'Tablet' || current.med_type__c == 'Capsule' )
          {
          ab.Remaining_Stock__c = remain  + (purc * strl * tabl );
          }  
          else if(current.med_type__c=='Antiboitic')
          {
          ab.Remaining_Stock__c = remain +  (purc * strl)   ;
          }
         
          }
      m1.Nomenclature__c=name;
            
      if(current.Mfg_Date__c==null || current.Purchase_Price__c==null || current.Sales_Price__c==null || current.Expiry_Date__c==null || current.Mfg_Date__c==null){
       ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAl,'Please Enter All the fields'));          
      }
     
      else if(expdate == current.Expiry_Date__c){
      update result2;
      } 
     
      else{
      insert m1;
      }
    
      }
        
      public void search(){
      searchres=[select Nomenclature__c,Expiry_Date__c,Mfg_Date__c,Purchase_Price__c,Purchase_Date__c,Maximum_level__c,Minimum_Level__c,Reorder_Level__c from Medicine_Inventory__c where Nomenclature__c =: searchvalue ];
      if(searchres==null){
      show=true;
      show1=false;
      }
      else{
      show=false;
      show1=true;
      }
      }
     
      public PageReference editaction() {
      return null;
      }
      
      public void sum(){
          calcul=100;
      }
    
      public void change1(){
       
          if(current.med_type__c == 'Tablet' || current.med_type__c == 'Capsule' ){
           shows=true;
           shows1=true;
          }
          else if(current.med_type__c == 'Antiboitic'){
          shows=true;
          shows1=false;
          }
          else{
          shows=false;
          }    
      }
}
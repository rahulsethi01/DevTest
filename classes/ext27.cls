public class ext27 {

    public map<id,IPD__c>result {get;set;}
    public map<id,OPD__c>result1 {get;set;}
   
    public Boolean showa{get;set;}    
    public Boolean showb{get;set;}
    public Boolean showc{get;set;}
    public Boolean show1{get;set;}    
    public Boolean show2{get;set;}
    public Boolean show3{get;set;}
    
    public Medicine_Issued__c current {get;set;}
    public ext27(ApexPages.StandardController controller) {
    current=(Medicine_Issued__c)controller.getRecord();
     showa=false;
     showb=false;
     showc=false;
     show1=false;
     show2=false;
     show3=false;
    }
    
    public void change()
    {
    if(current.Select__c == 'IPD')
    {
    showa=true;
    showb=false;
    showc=false;
    }
    if(current.Select__c == 'OPD')
    {
    showb=true;
    showa=false;
    showc=false;
    }
     if(current.Select__c == 'Others')
    {
    
    showc=true;
    showa=false;
    showb=false;
    show1=false;
    show2=false;
    show3=false;
     current.Name__c=' ';
     current.Email__c=' ';
     current.Age__c=Null;
     current.Address__c='';
     
   /* if(result.isempty()==false){
      result.clear();
      }
      if(result1.isempty()==false){
      result1.clear();
      } */
    }
    }

 public void change1()
    {
    if(current.Select__c == 'IPD')
    {
    
     result=new map<id,IPD__c>([select id,Name__c,Age__c,Email__c,Address__c from IPD__c where id=:current.IPDs__c]);
     current.Name__c=result.values().Name__c;
     current.Email__c=result.values().Email__c;
     current.Age__c=result.values().Age__c;
     current.Address__c=result.values().Address__c;
     
     show1=true;
     show2=false;
     show3=false;
   
    }
   else if(current.Select__c == 'OPD')
    {
    result1=new map<id,OPD__c>([select id,Name__c,Age__c,Email__c,Address__c from  OPD__c where id=:current.OPDs__c]);
    
     current.Name__c=result1.values().Name__c;
     current.Email__c=result1.values().Email__c;
     current.Age__c=result1.values().Age__c;
     current.Address__c=result1.values().Address__c;
     
     show1=false;
     show2=true;
     show3=false;
    }
    }
}
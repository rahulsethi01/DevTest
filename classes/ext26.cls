public class ext26 {


    public list<IPD__c>result=new list<IPD__c>();
    public list<OPD__c>result1=new list<OPD__c>();
    
    public Boolean show{get;set;}
    public Boolean show1{get;set;}
    public Boolean show2{get;set;}
    public Boolean showa{get;set;}
    public Boolean showb{get;set;}
    public Boolean showc{get;set;}
    
    public Medicine_Issued__c current {get;set;}
    public ext26(ApexPages.StandardController controller) {
    current=(Medicine_Issued__c)controller.getRecord();
    show=false;
    show1=false;
 
    }

public void change(){
   
if(current.Select__c == 'IPD')
{   showa=true;
    showb=false;
    showc=false;  
    
     }
else if(current.Select__c == 'OPD')
{ 
showa=false;
showb=true;
showc=false; 
}
else if(current.Select__c == 'Others')
{ 
showa=false;
showb=false;
showc=true; 
}

}

public void change1(){
   
if(current.Select__c == 'IPD')
{   show=true;
    show1=false;
    
 result=[select  id,Name__c,Email__c,Age__c,Address__c from IPD__c where id=:current.IPDs__c];  
 for(IPD__c abv:result)
 {
 current.Name__c=abv.Name__c;
 current.Email__c=abv.Email__c;
 current.Age__c=abv.Age__c;
 current.Address__c=abv.Address__c;
 } 
    
}
else if(current.Select__c == 'OPD')
{ 
show=false;
show1=true;

result1=[select  id,Name__c,Email__c,Age__c,Address__c from OPD__c where id=:current.OPDs__c];
  for(OPD__c abw:result1)
{
 current.Name__c=abw.Name__c;
 current.Email__c=abw.Email__c;
 current.Age__c=abw.Age__c;
 current.Address__c=abw.Address__c;
}
}
}


public void getsearch()
{
}
public void getsearch1()
{
}
public PageReference show()
{
return null;
}
public PageReference show1()
{
return null;
}
}
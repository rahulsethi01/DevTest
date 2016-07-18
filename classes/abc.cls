public with sharing class abc {

Ford__c fObj=new Ford__c();                                  // object objname=new object();
Ford__c con;                                                 // defining controller
    public abc(ApexPages.StandardController controller) {
    con=(Ford__c)Controller.getRecord();                     // retaining value in controller
    }
public Pagereference Save()
{
fobj.Vehicle_Name__c=con.Vehicle_Name__c;
fobj.Vehicle_Make__c=con.Vehicle_Make__c;
fobj.Model__c=con.Model__c;
fobj.Performance__c=con.Performance__c;
insert fobj;
 
return new PageReference('https://c.ap1.visual.force.com/apex/newform');
}

List<Ford__c> mylist = new List<Ford__c>();
public List<Ford__c> getdata()
{
mylist=[select Vehicle_Name__c from Ford__c limit 1 ];
return mylist;
}
}
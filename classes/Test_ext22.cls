@isTest
public class Test_ext22 {
@isTest
public static void ext22()
{
CloudComputing__c Dummy=new CloudComputing__c();
Apexpages.Standardcontroller emptysc = new Apexpages.Standardcontroller(Dummy);       
ext22 EmptyController = new ext22(emptysc);
EmptyController.addRow();
EmptyController.Save();
//EmptyController.deleteRow();
}
}
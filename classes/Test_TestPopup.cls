@isTest
public class Test_TestPopup {
@isTest
public static void TestPopup()
{
Drug__c dummy= new Drug__c();
Apexpages.Standardcontroller emptysc = new Apexpages.Standardcontroller(dummy);   
TestPopup EmptyController = new TestPopup(emptysc);

EmptyController.showPopup();
EmptyController.closePopup();
EmptyController.redirectPopup();
}
}
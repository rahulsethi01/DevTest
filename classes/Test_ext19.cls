@isTest
public class Test_ext19
{
@isTest
public static void ext19() 
 {
Medicine_Inventory__c DummyRoom = new Medicine_Inventory__c(Nomenclature__c='Cluegel7');
insert DummyRoom;
Apexpages.Standardcontroller emptysc = new Apexpages.Standardcontroller(DummyRoom);
ext19 EmptyController = new ext19(emptysc);
EmptyController.val=DummyRoom.id;
EmptyController.getmedoption1();
EmptyController.getdata();
EmptyController.newval();
//EmptyController.deletepopup();
EmptyController.showPopup();
EmptyController.closePopup();
EmptyController.redirectPopup();
EmptyController.editaction(); 
EmptyController.sum();
EmptyController.search();
EmptyController.change1();
EmptyController.updatepopup();
 }
}
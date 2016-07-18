@isTest
public class Test_ext14{
@isTest(SeeAllData=true)
    public static void  ext14(){
    test__c DummyRoom= new test__c();
       
       //   Room_Registration__c DummyRoom= new Room_Registration__c(Extra_Facility__c = 'A');
       //   system.assertequals(DummyRoom.Extra_Facility__c ,'A');
       
       Apexpages.Standardcontroller emptysc = new Apexpages.Standardcontroller(DummyRoom);       
       ext14 EmptyController = new ext14(emptysc);
       EmptyController.getshow();
       EmptyController.edit1();
       EmptyController.showfor();
         }
}
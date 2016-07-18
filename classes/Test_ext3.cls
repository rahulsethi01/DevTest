@isTest
public class Test_ext3{
@isTest(SeeAllData=true)
    public static void  ext3(){
    Drug__c DummyRoom= new Drug__c();
    upsert DummyRoom;
       
       //   Room_Registration__c DummyRoom= new Room_Registration__c(Extra_Facility__c = 'A');
       //   system.assertequals(DummyRoom.Extra_Facility__c ,'A');
       
       Apexpages.Standardcontroller emptysc = new Apexpages.Standardcontroller(DummyRoom);       
       ext3 EmptyController = new ext3(emptysc);
       EmptyController.save();
         }
}
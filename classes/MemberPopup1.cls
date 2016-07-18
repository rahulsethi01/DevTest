public class MemberPopup1
{
    public List<CloudComputing__c> memberList {get;set;}
    public List<CloudComputing__c> memberAddList {get;set;}
    public String memberName {get;set;}
    public Integer rowNum{get;set;}
   
    public MemberPopup1()
    {
        String sql = 'SELECT CRM_Name__c,Charges__c,Configuration__c,Plan__c FROM CloudComputing__c';
        memberList = Database.Query(sql);
        memberAddList = new List<CloudComputing__c>();
        memberAddList.add(new CloudComputing__c());
    }
       
    public void AddRow()
    {
        memberAddList.add(new CloudComputing__c());
    }
   
    public void delRow()
    {
        rowNum = Integer.valueOf(apexpages.currentpage().getparameters().get('index'));
        memberAddList.remove(rowNum);  
    }   
   
    public void saveMemb()
    {
        insert memberAddList;
    }
}
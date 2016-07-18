public class MemberPopup
{

    public PageReference delRow() {
        return null;
    }

   public PageReference cancel() {
        return null;
    }
   public PageReference save() {
        return null;
    }

    public List<CloudComputing__c> memberList {get;set;}
    public List<CloudComputing__c> memberAddList {get;set;}
    public List<CloudComputing__c> resultdelete {get;set;}
    public String memberName {get;set;}  
    public string val {get;set;}
    public Integer count {get;set;}
    
    public MemberPopup()
    {
        String sql = 'SELECT CRM_Name__c,Charges__c,Configuration__c,Plan__c FROM CloudComputing__c';
        memberList = Database.Query(sql);
        memberAddList = new List<CloudComputing__c>();
        memberAddList.add(new CloudComputing__c());
        count=0;
    }
   
    public void AddRow()
    {
        memberAddList.add(new CloudComputing__c());
        count=count + 1;
        
    } 
    
     public void deleteRow() {
     resultdelete=[select id,CRM_Name__c,Charges__c,Configuration__c,Plan__c from CloudComputing__c where id=:val];
     delete resultdelete;   

    }
}
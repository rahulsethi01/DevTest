public class ext18 {

    public list<Medical_type__c>result   = new list<Medical_type__c>();
     public list<Medical_type__c>result1 = new list<Medical_type__c>();
    public ext18(ApexPages.StandardController controller) {

    }

public list<SelectOption> getselfun()
{
   List<SelectOption> st = new List<SelectOption>();
   
    result =[select name from Medical_type__c];
    st.add(new selectoption('---select med type--','---Select med type---'));
    for(Medical_type__c s:result ){
    st.add(new selectoption(s.name,s.name));
       }
return st;
}

}
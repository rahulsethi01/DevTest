public class ext17 {


public List <selectoption> st = new list <selectoption>();
public list<Medicine_Inventory__c> stoc =new list<Medicine_Inventory__c>();

    public ext17(ApexPages.StandardController controller) {

    }

public List<selectoption> getStocks() {
    stoc =[select id,name from Medicine_Inventory__c];
    st.add(new selectoption('---select stock--','---Select stock---'));
    for(Medicine_Inventory__c s:stoc ){
    st.add(new selectoption(s.id,s.name));
    }
        return st ;
    }
}
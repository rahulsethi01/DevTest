public with sharing class wrapperpagination {
public PageReference del() {
    return null;
}

public String contextItem{get;set;}

private ApexPages.StandardSetController setCon;

private Set<Id> selectedContactIds;

public wrapperpagination()
{

    this.selectedContactIds= new Set<Id>();

    this.setCon= new ApexPages.StandardSetController( [SELECT Id, FirstName, LastName, Title, Phone, Email FROM Contact] );
    this.setCon.setpageNumber(1);
    this.setCon.setPageSize(3);

}

public void doSelectItem(){

    this.selectedContactIds.add(this.contextItem);

}

public void doDeselectItem(){

    this.selectedContactIds.remove(this.contextItem);

}

public Integer getSelectedCount(){

    return this.selectedContactIds.size();

}

public void doNext(){

    if(this.setCon.getHasNext())
        this.setCon.next();

}

public void doPrevious(){

    if(this.setCon.getHasPrevious())
        this.setCon.previous();

}

public List<CCWRowItem> getContacts(){

    List<CCWRowItem> rows = new List<CCWRowItem>();

    for(sObject r : this.setCon.getRecords()){
        Contact c = (Contact)r;

        CCWRowItem row = new CCWRowItem(c,false);
        if(this.selectedContactIds.contains(c.Id)){
            row.IsSelected=true;
        }
        else{
            row.IsSelected=false;
        }
        rows.add(row);
    }

    return rows;

}

/*
*   return whether previous page exists
*/
public Boolean getHasPrevious(){

    return this.setCon.getHasPrevious();

}

/*
*   return whether next page exists
*/
public Boolean getHasNext(){

    return this.setCon.getHasNext();

}

public Integer getPageNumber(){

    return this.setCon.getPageNumber();

}


Public Integer getTotalPages(){

    Decimal totalSize = this.setCon.getResultSize();
    Decimal pageSize = this.setCon.getPageSize();

    Decimal pages = totalSize/pageSize;

    return (Integer)pages.round(System.RoundingMode.CEILING);
}

public with sharing class CCWRowItem{

    public Contact tContact{get;set;}
    public Boolean IsSelected{get;set;}

    public CCWRowItem(Contact c, Boolean s){
        this.tContact=c;
        this.IsSelected=s;
    }

}
}
public with sharing class invoiceExtension {
    
    public id urlid;
    public Opportunity current{get;set;}
    
    public invoiceExtension(ApexPages.StandardController controller) {
        current=(Opportunity)controller.getRecord();
        urlid=apexpages.currentpage().getparameters().get('oppid');
    }
    
    public void dorequest(){
    
    }

}
public with sharing class SendemailExt {
    public id urlid;
    public list<attachment> attachmentlist = new list<attachment>();
    public list<Opportunity> opplist = new list<Opportunity>();
    public Opportunity current{get;set;}
    public SendemailExt(ApexPages.StandardController controller) {
        current=(Opportunity)controller.getRecord();
        urlid=apexpages.currentpage().getparameters().get('oppid');
    }
    
    public pagereference send(){
    string mail; 
     oppList = [select id,name from Opportunity where id =: urlid ];
            PageReference pdf =  new PageReference('/apex/proposalpdf?oppid='+urlid);         
             // Grab it!
             Blob b = pdf.getContentAsPdf();
                 
             Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
             email.setSubject('Invoice Detail');
            // String [] toAddresses = new String[] {if(AdditionalEmail <> null)AdditionalEmail,if(ContEmail <> null)ContEmail};
            String [] toAddresses = new String[] {};
            //if(AcList.get(ac.Account__c).Billing_Email__c <> null  && AcList.get(ac.Account__c).Billing_Email__c <> ''){
            toAddresses.add('rahul.sethi@ayodia.com');
            //}
            
             email.setToAddresses(toAddresses);
             email.setPlainTextBody('PFA your Invoice detail.');
             // Create an email attachment
             Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
             efa.setFileName('InvoicePDF.pdf'); // neat - set name of PDF
             efa.setBody(b); //attach the PDF
             email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
             // send it, ignoring any errors (bad!)
             Messaging.SendEmailResult [] r =  Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
             
             Attachment attchobj = new Attachment();
             attchobj.Name     = oppList[0].name;
             attchobj.body     = b;
             attchobj.ParentId = urlid; 
             attchobj.ContentType = 'pdf';
             attachmentlist.add(attchobj);
             
             if(attachmentlist.isempty() == false){
                 insert attachmentlist;
             }
             
            pagereference Redirectpage = new pagereference('/'+urlid);
            Redirectpage.SetRedirect(true);
            return Redirectpage; 
       
       }    
}
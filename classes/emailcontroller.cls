public with sharing class emailcontroller {

   public String emailAddress = 'rahul.sethi@svimtech.com';
   public PageReference sendemail() {
        return null;
    }
    
    public void sendemail1()  {
    
    }
    
     public void sendemail2()  {
        
      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();  
        
      mail.setToAddresses(new String[] {emailAddress});  
      mail.setSubject('Test');  
     //mail.setPlainTextBody('This case has been closed ');  
        
        mail.setHtmlBody('Dear '+ 'Bill name '+','
             +

                '<table width="100%" border="1" bgcolor="white">'
                +
                ' <tr width="100%" bgcolor="lightblue"><td style="padding-left:10px;width:41%">Payslip No</td>'
                +
                '<td style="width:41%">Employee Name</td>'+
                +
                '</tr>'
                +'</table>');
        
      Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail }); 
    }
}
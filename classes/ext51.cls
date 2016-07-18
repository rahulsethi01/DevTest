public class ext51 {
    public Account accrequest{get;set;}
    public ext51(ApexPages.StandardController controller) {
    accrequest = new Account();
    }
    
    public void save(){
    system.debug('====hiiiiiiiiii=======');
      list<string> emailchk = ((accrequest.Acc_email__c).split('@', 2));
        system.debug('====emailchk======'+emailchk);
    if(emailchk[1] <> 'dupont.com'){
    system.debug('====emailchk0======'+emailchk[0]);
        system.debug('====emailchk======'+emailchk[1]);  
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Not Valid Email')); 
    }
    }
}
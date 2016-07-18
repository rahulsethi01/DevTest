public class TwilioClientController {

    public PageReference sendSms() {
        return null;
    }

       private TwilioCapability capability;
        public string to{get;set;}
        public string frm{get;set;}
        public string txt{get;set;}
    

        public TwilioClientController() {
        //create capability token 
                capability = TwilioAPI.createCapability();
                // add outgoing and incomming facility to this token
                capability.allowClientOutgoing(TwilioAPI.getTwilioConfig().ApplicationSid__c,null);
                // giving a name to client on which this token will be used
                capability.allowClientIncoming('jenny');
                       
        }
       

        public String getToken() { return capability.generateToken(); }

        
    
        
        
}
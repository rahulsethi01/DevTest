global class TwilioSupport{

    webService static String sendSms(String to, String frm, String body)
        {
        TwilioRestClient client = TwilioAPI.getDefaultClient();
        Map<String,String> params = new Map<String,String>{
        'To' => to,
        'From' => frm,
        'Body' => body
        
        };
        TwilioSMS sms = client.getAccount().getSMSMessages().create(params);
        system.debug(to+'~~'+frm+'~~'+body);
        return sms.getStatus();
        }
        
         webService static String getAjaxToken()
        {
      
         TwilioCapability  capability1= TwilioAPI.createCapability();
         capability1.allowClientOutgoing( TwilioAPI.getTwilioConfig().ApplicationSid__c,null);
        
            return capability1.generateToken();            
                       
        
        
        
        }

}
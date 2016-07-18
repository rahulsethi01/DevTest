public class TwilioPageController {
    public String status { get; set; }
    public String message { get; set; }
    public String phoneNumber { get; set; }

    TwilioAccount account = TwilioAPI.getDefaultAccount();
    String myPhoneNumber = 
        account.getIncomingPhoneNumbers().getPageData()[0].getPhoneNumber();

    public PageReference sendSMS() {
        Map<String, String> params = new Map<String, String>{
            'From' => myPhoneNumber,
            'To' => phoneNumber,
            'Body' => message
        };

        try {
            TwilioSms sms = account.getSmsMessages().create(params);
            status = 'Sent SMS. SID: '+sms.getSid();
        } catch (Exception e) {
            status = 'Exception: '+e.getMessage();
        }

        phoneNumber = null;
        message = null;

        return null;
    }
}
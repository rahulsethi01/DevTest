public class ext37 {

    public String ACCOUNT_SID = 'AC6422d07884cb0dc5e261887bf1bfc7e3';
    public String AUTH_TOKEN = 'ef73e4a6003e0fa77cf3932033f4fe9a';
    public ext37(ApexPages.StandardController controller) {
    }
  
  
  public void testing()
  {
TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

Map<String,String> properties = new Map<String,String> {
            'To'   => '+1720-408-2924',
            'From' => '+1720-408-2924',
            'Body' => 'Hello!'
    };
TwilioMessage message = client.getAccount().getMessages().create(properties);
  }
}
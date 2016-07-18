public class SampleClass{

String account = 'AC6422d07884cb0dc5e261887bf1bfc7e3';
String token = 'ef73e4a6003e0fa77cf3932033f4fe9a';

public PageReference hello(){
TwilioRestClient client = new TwilioRestClient(account, token);

Map<String,String> params = new Map<String,String> {
        'To'   => '+919463411229',
        'From' => '+919910728457'
    };
TwilioCall call = client.getAccount().getCalls().create(params);
return null ;

}

}
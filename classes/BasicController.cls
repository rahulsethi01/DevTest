public with sharing class BasicController {

    public void doRequest() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://werindia.com/salesforce/test.php');
        req.setMethod('GET');
        Http h = new Http();
        HttpResponse res = h.send(req);
        
        System.assert(false,res);
       
  system.debug('=============HttpResponse=========='+res);
    }
}
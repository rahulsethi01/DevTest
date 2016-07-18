public with sharing class HttpCalloutSample {

    public HttpCalloutSample(ApexPages.StandardController controller) {

    }
// Pass in the endpoint to be used using the string url
    public void getContent(String url) {

// Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
    HttpRequest req = new HttpRequest();
    HttpResponse res = new HttpResponse();
       
// Instantiate a new http object
    Http http = new Http();
      
    string test = '<Request><APIUsername>mycompany</APIUsername><APIKey>1234567890</APIKey><Name>John and Jane Doe</Name></Request>'; 
      
        req.setEndpoint('https://tools.cleanpowerfinance.com/api/{context}/v1/{object}/{action}');
        req.setMethod('POST');
        req.setBody(test);
         req.setCompressed(true); // otherwise we hit a limit of 32000
 
        try {
            res = http.send(req); } 
        catch(System.CalloutException e) {
            System.debug('Callout error: '+ e);
            System.debug(res.getBody());
        }

}
}
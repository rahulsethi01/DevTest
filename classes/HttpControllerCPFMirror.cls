public class HttpControllerCPFMirror {

  public String Headers {get; set;}
  public String Response {get; set;}

  public void doRequest() {
 // String data = '<Request><APIUsername>calsolar</APIUsername><APIKey>05A6E4D01835CA574276FDAE5404D2</APIKey><UserEmail>sf@basati.com</UserEmail><Customer><CFirstname>Matt1</CFirstname><CLastname>Nesci</CLastname><CType>residential</CType><NewBuild>retrofit</NewBuild><CZip>50225</CZip></Customer></Request>';

  String data = '<Request><APIUsername>calsolar</APIUsername><APIKey>05A6E4D01835CA574276FDAE5404D2</APIKey><ProposalId>1083411</ProposalId><CustomerId>805449</CustomerId></Request>';
  
  System.HttpRequest request = new System.HttpRequest();
  request.setBody(data);
  request.setMethod('POST');
  request.setEndpoint('https://tools.cpfmirror.com/api/quoting/v1/job/get');


  System.HttpResponse response = new System.Http().send(request);
  //System.assert(false, response); //remove this once you fix the 403
  this.Response = response.getBody();
  system.debug('=============this.Response=========='+this.Response);
  
  }
}
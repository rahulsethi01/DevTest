public class WoopraController {

  public String Headers {get; set;}
  public String Response {get; set;}

  public void doRequest() {
  String data = '{'
    + '\n' + '"website":"yourwebsite",'
    + '\n' + '"segment":['
    + '\n' + '  {'
    + '\n' + '    "did":{'
    + '\n' + '      "operator":"AND",'
    + '\n' + '      "filters":['
    + '\n' + '        {'
    + '\n' + '          "scope":"actions",'
    + '\n' + '          "key":"name",'
    + '\n' + '          "match":"match",'
    + '\n' + '          "value":"quote"'
    + '\n' + '        }'
    + '\n' + '      ]'
    + '\n' + '    },'
    + '\n' + '    "are":{'
    + '\n' + '      "operator":"AND",'
    + '\n' + '      "filters":[]'
    + '\n' + '    }'
    + '\n' + '  }'
    + '\n' + '],'
    + '\n' + '"offset":0,'
    + '\n' + '"report_id":-1' +
  '}';

  System.HttpRequest request = new System.HttpRequest();
  request.setBody(data);
  request.setMethod('POST');
  request.setEndpoint('http://www.woopra.com/');
  request.setHeader('X-Api-Version',   '2.0');
  request.setHeader('X-Access-Id',     'R3GGRE0AG51Z3G7GTAJQO86H35JMU8N4');
  request.setHeader('X-Access-Secret', 'PsQ3ov50vZ13ZqaCshPXgvc6CC9YTgKqg9oSFVxrON84c8MdGVZYJ2nlPGsrxZA6');

  System.HttpResponse response = new System.Http().send(request);
  System.assert(false, response); //remove this once you fix the 403
  this.Response = response.getBody();
  }
}
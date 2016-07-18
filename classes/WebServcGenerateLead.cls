global with sharing class WebServcGenerateLead {

  Webservice  static void CreateLead(string Firstname, string lastname, string Status){
  
      Lead LeadRow = new Lead(Firstname = Firstname,lastname = lastname,Status = Status);
      insert LeadRow;
  }

}
public class pagination_controller {
    public Integer noOfRecordPerPage {get;set;}
    public Integer selectedPage {get;set;}
    public Map<Integer, List<Lead >> mapLeads{get;set;}
    public List<selectoption> pagesOptions {get;set;}
    public pagination_controller(ApexPages.StandardController controller) {
        mapLeads =new Map<Integer, List<Lead >> ();
        noOfRecordPerPage = 10;
        selectedPage = 1;
        List<Lead> listLeads = [select Name from Lead limit 21];
        if(listLeads.size()>0){
            pagesOptions = new List<SelectOption>();
            integer total_no_of_pages = listLeads.size()/noOfRecordPerPage;                 
            if(math.mod(listLeads.size(),noOfRecordPerPage) > 0){
               total_no_of_pages = total_no_of_pages +1;
            }
            integer pageStartValue = 0;
            integer pageEndValue = noOfRecordPerPage;
          for(integer i = 0; i<total_no_of_pages ; i++){
                integer counter = i+1;
                pagesOptions.add(new SelectOption(counter+'',counter +''));
                List<Lead> leadList = new List<Lead>();
               for(integer j = pageStartValue ; j< pageEndValue; j++){
                        try{
                            leadList.add(listLeads[j]);
                        }
                        catch(Exception e) {
                        }
                }
                pageStartValue = pageEndValue;
                pageEndValue = noOfRecordPerPage*(i+2);
            mapLeads.put(counter,leadList);
           }
        }
  }  
    public void nextPage(){}
}
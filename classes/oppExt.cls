public with sharing class oppExt {

    public list<Opportunity> opplist = new list<Opportunity>();
    public oppExt(ApexPages.StandardController controller) {

    }

    public void go(){
    try{
        for(integer i=0;i<4;i++){
            Opportunity oppobj = new Opportunity();
            oppobj.name                 = 'test'+i;
            oppobj.ForecastCategoryName = 'Pipeline';
            oppobj.CloseDate            = system.today();
            oppobj.StageName                 = 'Closed Won';
            opplist.add(oppobj);
        }
        system.debug('=========opplist======='+opplist);
        
           Opportunity oppobj1 = new Opportunity();
            oppobj1.name                 = 'testNew';
            oppobj1.ForecastCategoryName = 'Pipeline';
            oppobj1.CloseDate            = system.today();
            //oppobj1.StageName                 = 'Closed Won';
            opplist.add(oppobj1);
             system.debug('=========opplist======='+opplist);
             
         for(integer i=5;i<9;i++){
            Opportunity oppobj2 = new Opportunity();
            oppobj2.name                 = 'test'+i;
            oppobj2.ForecastCategoryName = 'Pipeline';
            oppobj2.CloseDate            = system.today();
            oppobj2.StageName                 = 'Closed Won';
            opplist.add(oppobj2);
        }
          system.debug('=========opplist======='+opplist);
          
         insert opplist; 
         
          system.debug('=========opplist======='+opplist);
    }
    catch(Exception e){
    system.debug('=======Exception========'+e);
    }
   } 
}
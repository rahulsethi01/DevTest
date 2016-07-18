public with sharing class AcTExt {
    public boolean display{get;set;}
    public AcTExt(ApexPages.StandardController controller) {
        display = false;
    }
    
    public void showval(){
        display = true;
    }

}
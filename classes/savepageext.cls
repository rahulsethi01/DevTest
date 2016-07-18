public with sharing class savepageext {
    
    public student__c StudentController{get;set;}
    public id studid{get;set;}
    public list<student__c> StudentList = new list<student__c>();
    public list<student__c> newStudentList = new list<student__c>();
    
    public savepageext(ApexPages.StandardController controller) {
        StudentController = (student__c)controller.getRecord();
        studid = apexpages.currentpage().getparameters().get('id');
        
        StudentList = [select id,name,Name__c,Age__c,Father_Name__c,Mother_Name__c,AvgAge__c from student__c where id =: studid ];
        if(StudentList.isempty() == false){
            StudentController = StudentList[0];
        }   
    }
    
    public void savestudent(){
        newStudentList.add(StudentController);
            if(newStudentList.isempty()== false){
                upsert newStudentList;
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Data Saved Successfully...'));  
            } 
    }

}
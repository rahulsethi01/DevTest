public with sharing class WrapExt {
    
    public list<Wrap_Student__c> studentlist = new list<Wrap_Student__c>();
    
    public WrapExt(ApexPages.StandardController controller) {

    }
    
    public list<Wrap_Student__c> getValues() {
        studentlist = [select id,name,Age__c,Class_Id__c from Wrap_Student__c];
        return studentlist;
    }
    
    public list<wrappernewclass> getValues1() {
        studentlist = [select id,name,Age__c,Class_Id__c from Wrap_Student__c];
        list<wrappernewclass> wrapclassobj = new list<wrappernewclass>();
        
        for(Wrap_Student__c st: studentlist ){
           system.debug('=====wrapclassobj======'+wrapclassobj);
            wrappernewclass wrapInstance = new wrappernewclass(st,'Class','Section');
            wrapclassobj.add(wrapInstance);
            system.debug('=====wrapclassobj======'+wrapclassobj);
        }
        system.debug('=====wrapclassobj======'+wrapclassobj);
        return wrapclassobj;
    }
    
    public class wrappernewclass{
        public Wrap_Student__c Classlist{get;set;}
        public string classname{get;set;}
        public string SectionName{get;set;}
        
        public wrappernewclass(Wrap_Student__c Classlist1,string classname1,string SectionName1){
            Classlist   = Classlist1;
            classname   = classname1;
            SectionName = SectionName1;   
        } 
    }
    
}
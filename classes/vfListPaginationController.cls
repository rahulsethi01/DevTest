public with sharing class vfListPaginationController {

private Static Final Integer PAGE_NUMBER = 10;
 
 public vfListPaginationController() {
 String qryString = 'SELECT Id,Subject FROM Event ';
  List<Event> articleList1= Database.query(qryString);
  maxSize = articleList1.size() ;
 }
 
 //Keeps track of current page & max size of article list
 Integer currentPage = 1;
 Integer maxSize = 1;
 
 // Returns whether we need to see previous button or not
 public boolean getPrevRequired() {
  return currentPage > 1;
 }

 // Returns whether we need to see next button or not
 public boolean getNextRequired() {
  return currentPage * PAGE_NUMBER < maxSize;
 }
 
 //Returns current page number 
 public Decimal getCurrentPageNumber() {
  return this.currentPage;
 }

 //action for next click
 public PageReference next() {
  if(maxSize > this.currentPage * PAGE_NUMBER) {
   this.currentPage = this.currentPage + 1;
  }
  return null;
 }    
 
 //action for previous click
 public PageReference previous() {        
  if(this.currentPage > 1)
   this.currentPage = this.currentPage - 1;
  return null;
 }


}
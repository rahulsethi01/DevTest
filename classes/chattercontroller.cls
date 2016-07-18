public with sharing class chattercontroller {

   public void dorequest() {
    FeedItem post = new FeedItem();
    post.ParentId = '0069000000ELMbf'; //eg. Opportunity id, custom object id..
    post.Body = 'Hi Its Rahul here';
    insert post;
   }
}
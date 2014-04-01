global class IncidentReport{
    
    private ApexPages.StandardController stdCtrl; 
        
    public IncidentReport(ApexPages.StandardController ctrl){
        this.stdCtrl = ctrl;
    }
    
	//@remoteAction
    //global static String createIncidentReport(String param){
    //        return 'made the round trip: ' + param;
    //}
    
    @remoteAction
    global static String createIncidentReport(Damage_Report__c dr){
        String response; 
        SavePoint sp;
        
        try{
            sp = Database.setSavepoint();
            insert dr; 
            response = dr.Id;
            
            Merchandise__c m = new Merchandise__c(id=dr.Merchandise__c, Condition__c='Damaged');
            update m; 
            
        } catch (DMLException e) {
            Database.rollback(sp);
        	response = e.getMessage();   
        }
                
        return response;
    }

    @remoteAction
    global static String postToChatter(String versionId, String recId){
    	
    	//retrieve content doc Id
    	String docId = [select ContentDocumentId from ContentVersion where id = :versionId].ContentDocumentId;
    	
    	//all the components of the post
    	ConnectApi.TextSegmentInput postText = new ConnectApi.TextSegmentInput();
    	ConnectApi.HashtagSegmentInput postHashtag = new ConnectApi.HashtagSegmentInput();
    	List<ConnectApi.MessageSegmentInput> bodyParts = new List<ConnectApi.MessageSegmentInput>();
    	ConnectApi.MessageBodyInput postBody = new ConnectApi.MessageBodyInput(); 
    	ConnectApi.ContentAttachmentInput file = new ConnectApi.ContentAttachmentInput();
    	ConnectApi.FeedItemInput feedPost = new ConnectApi.FeedItemInput();
    	
    	//individual body segments
    	postText.text = 'There was a Damage Report filed';
    	postHashtag.tag = 'Damage Report';
    	
    	//list of segments
    	bodyParts.add((ConnectApi.MessageSegmentInput)postText);
    	bodyParts.add((ConnectApi.MessageSegmentInput)postHashtag);
    	
    	//set list into FeedItemInput instance
    	postBody.messageSegments = bodyParts; 
    	
    	
    	//content id for existing file
    	file.contentDocumentId = docId;
    	
        
        feedPost.attachment = file; 
        feedPost.body = postBody;
        feedPost.isBookmarkedByCurrentUser = false;
        feedPost.visibility = ConnectApi.FeedItemVisibilityType.InternalUsers;
        
        ConnectApi.FeedItem newFeedItem = ConnectApi.ChatterFeeds.postFeedItem('internal', ConnectApi.FeedType.Record, recId, feedPost, null);
        
    	return String.valueof(FeedItem.id); 
    }
}
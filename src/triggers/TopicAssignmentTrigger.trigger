trigger TopicAssignmentTrigger on TopicAssignment (after insert) {
    
    /*SOQL of note: 
    TOPIC All Fields 
    Select t.TalkingAbout, t.SystemModstamp, t.Name, t.Id, t.Description, t.CreatedDate, t.CreatedById From Topic t
    
    TOPICASSIGNMENT All Fields:
    
    FEEDITEM All Fields
    
    */
    
    //Lists to build in trigger
    List<TopicAssignment> correctTAInsert = new List<TopicAssignment>(); //new list of topic assignments we will add  
    List<TopicAssignment> graylistTADelete = new List<TopicAssignment>(); //list of topic assignments to wipe out
    
    Set<Id> feedItemIdSet = new Set<Id>();
    
    
    for (TopicAssignment ta : [SELECT Id,EntityId,TopicId,Topic.Name from TopicAssignment where Id in : Trigger.new]) {
    	
        //skip if trigger is recursive. 
        if (TopicHelper.firstRun){ 
	        if (TopicHelper.kBlacklist.keySet().contains(ta.Topic.Name)){

	            TopicAssignment newTopic = new TopicAssignment();
	            newTopic.EntityId=ta.EntityId;
	            System.debug('The bad topic is: '+ta.Topic.Name);
	            newTopic.TopicId=TopicHelper.whiteTopicsDB.get(TopicHelper.kBlacklist.get(ta.Topic.Name)).Id;
	            
	            correctTAInsert.add(newTopic);
	            
	            graylistTADelete.add(new TopicAssignment(Id=ta.Id));
	            
	        }
        }
    }
	TopicHelper.firstRun = false;
	        
    System.debug('To INSERT----->' +correctTAInsert);
    System.debug('To DELETE----->' +graylistTADelete);
	
    delete graylistTADelete;
    insert correctTAInsert;
    
//-->lead    TopicHelper.convertLeads(leadsToConvert);
}
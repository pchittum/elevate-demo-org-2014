public without sharing class TopicHelper {
	
	/*
	
	*/
	
	//we are calling insert for an object with an insert trigger
	//to avoid invoking the code twice, we will control reentry with this variable
	public static Boolean firstRun = true;

    public static Map<String,String> kBlacklist = new Map<String,String>();
        												
    // I need a map between the acceptable topics and an Id value.     												
	public static final Map<String,Topic> whiteTopicsDB = new Map<String,Topic>();
    
    
    static {
    	//normally something like this would be better in a custom setting
    	kBlacklist.put('Smellevate','ELEVATE');
    	kBlacklist.put('Elevat','ELEVATE');
    	kBlacklist.put('Developpeur','Developer');
    	kBlacklist.put('Dev','Developer');
    	
    	
    	//dedupe "good" topics   	
    	Set<String> whiteTopicNames = new Set<String>(kBlacklist.values());
    	
    	for (Topic t : [SELECT Id,Name,TalkingAbout from Topic where Name in : whiteTopicNames]){
    		whiteTopicsDB.put(t.Name,t);
    	}
    	
    	System.debug('GRAYLIST----->' + kBlacklist);
    	System.debug('TOPICS in DB----->' + whiteTopicsDB);
  	
    }    												
	
	//need all topics currently associated with this Entity record so that we don't duplicate 
	//the topic association record. No two topics should be assigned to the same feed post or
	//other entity. what is an entity will transform as this feature evolves.
	public static Map<Id,Set<Id>> getExistingEntityTopics(List<TopicAssignment> tas){
		
		Map<Id,Set<Id>> existingEntityTopics = new Map<Id,Set<Id>>();
		Set<Id> entityIds = new Set<Id>();
		
		for (TopicAssignment ta : tas) {
			entityIds.add(ta.EntityId);
			
		}
		
		//This query is necessary to ensure that all other topics associated with this entity record are checked. 
		//for instance, if the topic SalesforceTopics was already used, but is not in the scope of Trigger.new
		//we need to make sure we don't attempt to assign it a second time.  
		for (TopicAssignment ta : [select EntityId,TopicId from TopicAssignment where EntityId in : entityIds]){
			if (!existingEntityTopics.keySet().contains(ta.EntityId)){
				existingEntityTopics.put(ta.EntityId,new Set<Id>{ta.TopicId});
				
			} else {
				existingEntityTopics.get(ta.EntityId).add(ta.TopicId);
				
			}
		}
		return existingEntityTopics;
		
	}

}
trigger LineItemTrigger on Line_Item__c (after insert, after update) {
    
	MyDemoClass.fixLineItems(Trigger.new);
    
}
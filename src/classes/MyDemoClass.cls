public class MyDemoClass{
    
    Damage_Report__c dr = new Damage_Report__c(Description__c='this is a damage report');
    
    public static void fixLineItems(List<Line_Item__c> lis){
        List<Line_Item__c> liToWorkWith = new List<Line_Item__c>();
    
    	for (Line_Item__c li: lis){
        
            if (li.Quantity__c < 1){
                li.Quantity__c = 1; 
                liToWorkWith.add(li);     
            }
        
        }
    	Database.update(liToWorkWith); 
        
    }

}
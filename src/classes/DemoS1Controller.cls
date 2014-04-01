global class DemoS1Controller{
    
    /**
    Simple example of remote action.
    
    Why you might need this as a remote method? 
    
    This is a method that packages logic of saving both an account and contact. One option in the near future
    would be to use the new Visualforce remote object functionality, but for the time being that logic would
    not be made transactional. 
    
    Why this is only just plausible?
    
    Well...this is kind of what a lead is for. Create a lead, convert it, and you have an acccount and a 
    contact. Lead conversion will also assist with deduping where the account and contact already exist.  
    Maybe, just maybe you want to do this instead, but my point is that you don't absolutely *need* to do this
    in a real world scenario if you dont' have a programmer on staff and don't have budget to hire one.   
    */
    
    @remoteAction
    global static String createRecords(Account acctParam, Contact ctParam){
        
        String acctId; 

        Account acct = new Account(Name=acctParam.Name);
		insert acct;
        
        Contact ct = new Contact(FirstName=ctParam.firstName, LastName=ctParam.lastName, AccountId=acct.Id);
        insert ct; 
        
        return acct.Id;
    }

}
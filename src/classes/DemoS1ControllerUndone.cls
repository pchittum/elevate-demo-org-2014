global class DemoS1ControllerUndone{
    
    /**
    Simple example of remote action.
    
    Why you might need this as a remote method? 
    
    This is a method that packages logic of saving both an account and contact. But try not to focus on 
    Account and Contact. Instead think of pushing complexity into the controller. That's really what we're
    trying to accomplish with this simple example.  
    
    Why this example is only just plausible?
    
    Well...this is kind of what a lead is for. Create a lead, convert it, and you have an acccount and a 
    contact. Lead conversion will also assist with deduping where the account and contact already exist.  
    Again, think in the abstract about removing complexity from the JS code and you'll be on the right
    track. Don't focus too much specificaly on Account and Contact. 
    */
    
    //annotation to allow calling this method from the remote action JS API of visualforce
    @remoteAction
    global static String createRecords(Account acctParam, Contact ctParam){
        /* 
        TODO:
        In this remote method, add the following statements: 
        1. Create an instance of Account. 
        2. Set the name field of account to the acctParam's name value
        3. Create an instance of Contact
        4. Set FirstName and LastName from the corresponding values in ctParam
        5. Set the AccountId value to the new acct.Id value
        6. Fix the current return of an empty string by returning the account Id. 
        */
        
        return '';
    }

}
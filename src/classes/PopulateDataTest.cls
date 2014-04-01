@isTest
public class PopulateDataTest{

    @isTest
    public static void testDataPopulation(){
    	PopulateData.createData();
        PopulateData.wipe();
    }
    
}
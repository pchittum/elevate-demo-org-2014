public class DemoExtension{
    
    private ApexPages.StandardController stdCtrl; 
    
    public DemoExtension(ApexPages.StandardController ctrl){
        stdCtrl = ctrl; 
    }
    
    public void customQuickSave(){
        stdCtrl.getRecord().put('Type','Prospect');
        PageReference ref = stdCtrl.save();
    }
    
    public PageReference customSave(){
        stdCtrl.getRecord().put('Type','Prospect');
        PageReference ref = stdCtrl.save();
        return ref; 
    }    

}
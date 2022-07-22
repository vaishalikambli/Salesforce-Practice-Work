public class EditAllCustomProduct{
    public String recordID {get; set;}
    Public List<Opportunity_Line_Item__c> OppLnItData {get;set;}
    
    Public EditAllCustomProduct(){
        recordID = apexpages.currentpage().getparameters().get('oppid');
        OppLnItData = new List<Opportunity_Line_Item__c>();        
        
        OppLnItData = [SELECT id, Name, Opportunity_Name__c, Opportunity_Score__c, Order_Number__c, Probability__c, Product_Name__c, Quantity__c, Tracking_Number__c
                       FROM Opportunity_Line_Item__c
                       WHERE Opportunity_Name__c =: recordID
                      ];
    }

    /** 
    Save custom product in Opportunity line items
    */
    public PageReference Save() {
        PageReference pr = new PageReference('/' + recordID);        
        update OppLnItData;                
        return pr;
    }

    /**
    Cancel functionality - When user click on cancel button it will redirect to selected opportunity page
    */    
    public PageReference Cancel() {
        PageReference pr = new PageReference('/' + recordID);       
        return pr;
    }
}
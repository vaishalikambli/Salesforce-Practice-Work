public class OppCustomProduct {
    //Public Opportunity Opp {get; set;}
    Public Opportunity_Line_Item__c OppLineItem {get; set;}    
    Public List<Opportunity_Line_Item__c> OppLineItemList {get; set;}
    //public List<Opportunity_Line_Item__c> DeletedProductList = new List<Opportunity_Line_Item__c>();
    
    public String recordID {get; set;}
    
    Public OppCustomProduct(){
        //Opp = new Opportunity();
        OppLineItem = new Opportunity_Line_Item__c();        
        OppLineItemList = new List<Opportunity_Line_Item__c>();       
        
        recordID = apexpages.currentpage().getparameters().get('id');
        
       /* Opp = [SELECT id, name 
               FROM Opportunity
               WHERE id =: recordID
              ];*/
    }
    
    //Add custom product in a table 
    public PageReference AddRows() {
        Opportunity_Line_Item__c oppLineItCustProd = new Opportunity_Line_Item__c();
        
        oppLineItCustProd.Opportunity_Name__c = recordID;
        OppLineItemList.add(oppLineItCustProd);
        
        return null;
    }
    
    /** 
    Save custom product in Opportunity line items
    */
    public PageReference Save() {
        PageReference pr = new PageReference('/' + recordID);       
        insert OppLineItemList;
        
        /*if(DeleteProductList.size() > 0){
            Delete DeleteProductList;            
        }*/
        return pr;
    }

    /**
    Cancel functionality - When user click on cancel button it will redirect to selected opportunity page
    */    
    public PageReference Cancel() {
        PageReference pr = new PageReference('/' + recordID);       
        return pr;
    }
    
    /*public PageReference RemoveProduct() {
        Integer indexVal = Integer.valueof(system.currentpagereference().getparameters().get('index'));
        
        System.debug('Index value:: ' + indexVal);
        
        if(OppLineItemList[indexVal - 1].Id != null){
            DeletedProductList.add(OppLineItemList[indexVal - 1]);            
        }        
        
        //Remove the product from list    
        OppLineItemList.remove(indexVal - 1);
        
        return null;
    }*/
}
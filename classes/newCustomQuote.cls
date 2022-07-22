public class newCustomQuote {
    public String recordID {get; set;}
    Public QuoteCustom__c quoteData {get;set;}
    Public Opportunity Opp {get; set;}
    Public Quote_Line_Item__c ql {get;set;}
    Public List<Opportunity_Line_Item__c> OppLnItData {get;set;}
    Public List<Quote_Line_Item__c> QuoteLnItData {get;set;}
    
    Public newCustomQuote(){
        recordID = apexpages.currentpage().getparameters().get('id');        
        quoteData = new QuoteCustom__c();
        Opp = new Opportunity();
        OppLnItData = new List<Opportunity_Line_Item__c>();
        QuoteLnItData = new List<Quote_Line_Item__c>();
        
        Opp = [SELECT id, Name
               FROM Opportunity
               WHERE id =: recordID
              ];
        
        OppLnItData = [SELECT id, Name, Opportunity_Name__c, Opportunity_Score__c, Order_Number__c, Probability__c, Product_Name__c, Quantity__c, Tracking_Number__c
                       FROM Opportunity_Line_Item__c
                       WHERE Opportunity_Name__c =: recordID
                      ];        
		quoteData.Opportunity__c = recordID;   
    }
    
    /** 
    Save custom product in Quote line items
    */
     public PageReference SaveQuote() {
        PageReference pr = new PageReference('/' + recordID);
        
        //Initialize Opportunity record-id to quote 
        quoteData.Opportunity__c = recordID; 
        insert quoteData;
		
        for(Opportunity_Line_Item__c o : OppLnItData){
            //Create instance of Quote_Line_Item__c object to save value from opp line item 
            Quote_Line_Item__c qlitem = new Quote_Line_Item__c();
            
            qlitem.Opportunity_Line_Item__c = o.Id;
            qlitem.Opportunity__c = recordID;
            qlitem.Quote_Name__c = quoteData.Id;
            qlitem.Product__c = o.Product_Name__c;
            qlitem.Quantity__c = o.Quantity__c;
            qlitem.Opportunity_Score__c = o.Opportunity_Score__c;
            qlitem.Order_Number__c = o.Order_Number__c;
            qlitem.Probability__c = o.Probability__c;
            
            QuoteLnItData.add(qlitem);
        }
        
        /*for(Opportunity_Line_Item__c o : OppLnItData){
        	ql = New Quote_Line_Item__c (
                                         Opportunity_Line_Item__c = o.Id,
                                         Opportunity__c = recordID,
                                         Quote_Name__c = quoteData.Id,
                                         Product__c = o.Product_Name__c,
                                         Quantity__c = o.Quantity__c,
                                         Opportunity_Score__c = o.Opportunity_Score__c,
                                         Order_Number__c = o.Order_Number__c,
                                         Probability__c = o.Probability__c
                                        );
            QuoteLnItData.add(ql);
        }*/
        insert QuoteLnItData;
        return pr;
    }
    
    /**
    Cancel functionality - When user click on cancel button it will redirect to selected opportunity page
    */    
    public PageReference CancelQuote() {
        PageReference pr = new PageReference('/' + recordID);       
        return pr;
    }
}
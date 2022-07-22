@isTest
public class RecursiveTriggerOpportunityTest {
    
    @isTest
    public static void oppWithWebLead(){
       	List<Opportunity> oppList = new List<Opportunity>();
        
        Opportunity opp = new Opportunity();
        opp.name = 'testOpp';
        opp.LeadSource = 'Web';
        opp.StageName = 'Perception Analysis';
        opp.CloseDate = System.today();
        
        insert opp;
        
        oppList = [SELECT id, Name 
                   FROM Opportunity
                  ];
    
    	Test.startTest();
    	RecursiveTriggerOpportunityHandler.updateOpportunity(oppList);
    	Test.stopTest();
        
        List<Opportunity> updatedOpp = [SELECT id, Name, LeadSource  
                       			  		FROM Opportunity 
                       			  		WHERE LeadSource =: opp.LeadSource
                      			 ];
        for(Opportunity o : updatedOpp){
        	System.assertEquals('Web', o.LeadSource);
        }
    }    
}
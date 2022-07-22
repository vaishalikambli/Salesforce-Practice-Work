@isTest
public class CountOppOfAccountTest {

	@isTest
    public static void getTotalSumOpp(){
       	List<Opportunity> oppList = new List<Opportunity>();
        List<Account> accList = new List<Account>();
        
        accList = [SELECT id, Name from Account where name = 'Nutrichoice'];
        
        for(Account acc : accList){
        	Opportunity opp = new Opportunity();
        	opp.name = 'testOpp4';
        	opp.StageName = 'Perception Analysis';
            opp.Amount = 1000;
        	opp.AccountId = acc.id;
        	opp.CloseDate = System.today();    
            oppList.add(opp);
            
        	opp.name = 'testOpp6';
        	opp.StageName = 'Perception Analysis';
            opp.Amount = 2000;
        	opp.AccountId = acc.id;
        	opp.CloseDate = System.today();
            oppList.add(opp);
        }
        
        insert oppList;
       // system.debug('oppList :: ' + oppList);
    
    	Test.startTest();
    	CountOppOfAccount.getTotalAmountOpp();
    	Test.stopTest();
        
        List<Opportunity> updatedOpp = [SELECT id, Name, AccountId 
                                    	FROM Opportunity
                      			   	   ];
        system.debug('Updated opportunity :: ' + updatedOpp);
      /*  for(Opportunity o : updatedOpp){
        	System.assertEquals('Perception Analysis', o.StageName);
        }*/
    }    
}
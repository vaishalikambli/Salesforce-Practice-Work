@isTest
public class PreventAccDelMinTwoOppTest {
    
    @isTest
    public static void preventAccDelWithTwoMoreOpp(){
        Account acc = new Account(Name = 'Account Test 1');
        insert acc;
        
        List<Opportunity> oppList = new List<Opportunity>();
        for(Integer oppCnt = 1; oppCnt <= 3; oppCnt++ ){
            Opportunity opp = new Opportunity();
            opp.Name = 'Opp Test' + oppCnt;
            opp.StageName = 'Prospecting';
            opp.closeDate = System.today();
            opp.AccountId = acc.Id;
            oppList.add(opp);			            
        }
        
        System.debug('Opportunity list :: ' + oppList);
        
        if(!oppList.isEmpty()){
        	insert oppList;            
        }
        
        Test.startTest();
        Database.DeleteResult result = Database.delete(acc, false);
        Test.stopTest();
        
        //System.assert(!result.isSuccess());
        //System.assert(result.getErrors().size() > 0);
        //System.assertEquals('You can\'t delete this account', result.getErrors()[0].getMessage());
    }
}
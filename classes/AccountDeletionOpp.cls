/**
Create test class for preventing account delete if they have more than two opportunities
*/

public class AccountDeletionOpp {
    public static void preventAccDeletion(){
        List<Account> updAccList = new List<Account>();
        List<Account> accList = new List<Account>();
        
        accList = [SELECT id, name, Total_Opportunities__c, (SELECT id, name FROM Opportunities) FROM Account];
        System.debug('List of Accounts :: ' + accList);
        
        for(Account acc : accList){
            Integer totalOpportunities = acc.Opportunities.size();
            System.debug('Total totalOpportunities --> ' + totalOpportunities);
            
            if(totalOpportunities > 2 )
                acc.addError('You cannot delete this account');
        	}
    }
}
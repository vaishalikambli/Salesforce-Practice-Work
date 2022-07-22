/**
calculating all opportunities amount under any account 
*/


public class CountOppOfAccount {
    public static void getTotalAmountOpp(){

        AggregateResult[] totalAmountOpp = [SELECT AccountId, SUM(AMOUNT) 
                       						FROM Opportunity 
                       						GROUP BY AccountId 
                      					   ];
        system.debug('Total amount :: ' + totalAmountOpp);
    }
}
public with sharing class MyCalculator {
    
    @AuraEnabled
    public static List<Account> getAllAccounts(String likeValue){
        String matchValue = '%' + likeValue + '%';
        List<Account> allAccounts = [SELECT Id, Name, Phone, Industry, AnnualRevenue  
                                     FROM Account 
                                     WHERE Name like : matchValue 
                                     OR Phone like : matchValue 
                                     OR Industry like : matchValue 
                                     //OR AnnualRevenue like : annualVal 
                                    ];

        if(!allAccounts.isEmpty()){
            return allAccounts;
        }
        return new List<Account>();
    }   
}

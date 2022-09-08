trigger AccountDeletion on Account (before delete) {
    List<Account> updAccList = new List<Account>();
    List<Account> accList = new List<Account>();
    
    Set<Id> accIds = new Set<Id>();
          
    if(trigger.isBefore){
        
        if(trigger.isDelete){
            for(Account acc: Trigger.old) {
                accIds.add(acc.Id);
            }
        }
        
        accList = [SELECT id, name, Total_Opportunities__c, Total_Amount__c, (SELECT id, name FROM Opportunities) FROM Account WHERE id =: accIds ];
        System.debug('List of Accounts :: ' + accList);
        
        for(Account acc : accList){
            Integer totalOpportunities = acc.Opportunities.size();
            System.debug('Total totalOpportunities --> ' + totalOpportunities);
            
            if(totalOpportunities > 2 && acc.Total_Amount__c > 4000)
                Trigger.oldMap.get(acc.Id).addError('You cannot delete account');                
            else 
                updAccList.add(acc);
        }
    }
}
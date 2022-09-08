trigger CountContactOfAccount on Contact (after insert, after update, after delete) {
    List<Account> updAccList = new List<Account>();
    Set<Id> accIds = new Set<Id>();
    
    if(trigger.isAfter){
        if(trigger.isInsert || trigger.isUpdate){
            for(Contact con : Trigger.new){
                accIds.add(con.AccountId);
            }
        }
        
        if(trigger.isDelete){
            for(Contact con : trigger.old){
                accIds.add(con.AccountId);
            }
        }
    
        List<Account> accList = [SELECT id, name, Total_Contacts__c, (SELECT id, name FROM Contacts) FROM Account WHERE id =: accIds];
    
        for(Account acc : accList){
            Integer totalContacts = acc.Contacts.size();
            System.debug('Total contacts --> ' + totalContacts);
            acc.Total_Contacts__c = totalContacts;
            updAccList.add(acc);
        }
    }
    
    if(updAccList != Null){
        update updAccList;        
    }
}
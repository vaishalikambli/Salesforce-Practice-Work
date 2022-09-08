trigger RollupSummaryClass19 on Contact (after insert, after update, after delete) {
    
    //New list to perform DML on the final LIst of Accounts
    List<Account> ListToUpdate = New List<Account>();
    
    //New set of Account Ids that'd be used to get Accounts & Contacts List
    Set<ID> accountIds = New Set<ID>();
    
    //Using context variables and populating the above set
    if(trigger.isInsert || trigger.isUpdate){
        for(Contact conNew : Trigger.New){
            accountIds.add(conNew.AccountId);
        }
    }else if(trigger.isDelete){
        for(Contact conOld : Trigger.Old){
            accountIds.add(conOld.AccountId);
        }
    }
    
    //List of Accounts in this trigger populated using SOQL
    List<Account> accountList = New List<Account>();
    accountList = [SELECT Id 
                   FROM Account 
                   WHERE Id IN : accountIds
                  ];
    
    //List of Accounts in this trigger populated using SOQL
    List<Contact> contactList = New List<Contact>();
    contactList = [SELECT Id, AccountId, Salary__c  
                   FROM Contact 
                   WHERE accountId IN :accountIds
                  ];
    
    //New Map for Accounts and List of its Contacts
    Map<Id, List<Contact>> accConMap = new Map<Id, List<Contact>>();
    
    //Iterate through Contacts and populate the above map
    For(Contact con : contactList){
        if(!accConMap.keySet().contains(con.AccountId)){
            accConMap.put(con.AccountId, New List<Contact>());
        }
        accConMap.get(con.AccountId).add(con);
    }

    //Iterate through Accounts
    for(Account acc : accountList){
        Double Amount = 0;

        if(accConMap.get(acc.Id) != null && accConMap.get(acc.Id).size() > 0){
            //Iterate through List of Contacts and add the amounts in the Salary fields
            for(Contact con : accConMap.get(acc.Id)){
                if(con.Salary__c != null){
                    Amount += con.Salary__c;
                }
            }
        }
        acc.Total_Salary__c = Amount;
        ListToUpdate.add(acc);
    }
    update ListToUpdate;
}
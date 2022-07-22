trigger RollupSummaryClass19 on Contact (after insert, after update, after delete) {
    
    //New list to perform DML on the final LIst of Accounts
    List<Account> ListToUpdate = New List<Account>();
    
    //New set of Account Ids that'd be used to get Accounts & Contacts List
    Set<ID> accountIds = New Set<ID>();
    
    //Using context variables and populating the above set
    if(trigger.isInsert || trigger.isUpdate){
        for(Contact conNew : Trigger.New){
            //accountIds.add(conNew.)
        }
    }else if(trigger.isDelete){
        for(Contact conOld : Trigger.Old){
            //accountIds.add(conNew.)
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
    contactList = [SELECT Id 
                   FROM Contact 
                   WHERE accountid IN : accountIds
                  ];
    
    //New Map for Accounts and List of its Contacts
    Map<Id, List<Contact>> accConMap = new Map<Id, List<Contact>>();
    
    //Iterate through Contacts and populate the above map
    For(Contact con : contactList){
    }
}
trigger CountOfContactOnAcc on Account (after insert, after update) {
    Set<Id> accIds = new Set<Id>();
    List<Contact> contactsToInsert = new List<Contact>();
    List<Account> updatedAccList = new List<Account>();
    List<Contact> updatedConList = new List<Contact>();
    
    if(Trigger.isAfter){
        if(Trigger.isInsert){

            //Whenever a new account is inserted and count of contact (for example you give  5)then automatically 5 records are created on a contact.
            for(Account acc : Trigger.new){                
                for(Integer count = 1; count <= acc.Total_Contacts__c; count++){
                    Contact con = new Contact();
                    con.FirstName = 'Generic';
                    con.LastName = 'lastname-' + count; 
                    con.AccountId = acc.Id;
                    contactsToInsert.add(con);
                }
                accIds.add(acc.Id);
            }
            
            if(contactsToInsert.size() > 0){
                insert contactsToInsert;
            }
        }
        
     
        
       // updatedConList = [SELECT id, name, AccountId FROM Contact WHERE AccountId =: accIds];
       // System.debug('updated Con List :: ' + updatedConList);
        
        if(Trigger.isUpdate){            
            for(Account acc : updatedAccList){
                Integer totalContacts = acc.contacts.size();
                        updatedAccList = [SELECT id, name, Total_Contacts__c, (SELECT id, name FROM Contacts) 
                          FROM Account 
                          WHERE id =: accIds
                         ];
        System.debug('updated Acc List :: ' + updatedAccList);  
                updatedConList = [SELECT id, name, AccountId FROM Contact WHERE AccountId =: accIds];
                System.debug('updated Con List :: ' + updatedConList);
                
                for(Integer count=1; count <= acc.Total_Contacts__c; count++){
                    
                 //  contactsToInsert.add(con);                    
                }
            }
            if(contactsToInsert.size() > 0){
               upsert contactsToInsert;
            }            
        }
    }
}
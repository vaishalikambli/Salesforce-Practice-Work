public class BatchablePracticeClass implements Database.Batchable<SObject>{
    public integer recordCount = 0;

    public Database.QueryLocator start(Database.BatchableContext info){ 
        return Database.getQueryLocator([SELECT Id, Name, Description FROM Account WHERE Name like 'NewAccVK%']); 
    }     
    public void execute(Database.BatchableContext info, List<Account> scope){
       // List<Account> accsToUpdate = new List<Account>();
        List<Contact> conList = new List<Contact>();       
        
        for(Account a : scope){
           // a.Description = 'testing by VK';
            for(Integer count = 1; count <= 10000; count++){
                Contact con = new Contact();
                con.LastName = 'VKnew ' + count;
                con.AccountId = a.Id;
                conList.add(con);
            }            
        } 
        if(conList.size() > 0){
            insert conList;
        }
    }     
    public void finish(Database.BatchableContext info){
        System.debug('Job done!!! ' + recordCount);   
    } 
}
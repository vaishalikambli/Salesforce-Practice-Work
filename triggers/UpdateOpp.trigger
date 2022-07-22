trigger UpdateOpp on Account (after update) {
    List<Account> updAccList = new List<Account>();
    Set<Id> accIds = new Set<Id>();
    
    if(trigger.isAfter){
        if(trigger.isUpdate){
            List<Opportunity> opplist = new List<Opportunity>();
        
            for(Account acc : Trigger.old){
                Opportunity opp = new Opportunity();
                opp.Name = acc.Name;
                opp.AccountId = acc.Id;
                opp.StageName = 'Negotiation';
                opplist.add(opp);
            }
            insert opplist;
            System.debug('opplist list :: ' + opplist);
        }
    }
}
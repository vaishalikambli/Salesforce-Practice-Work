trigger AccountUpdate on Account (after insert) {    
 if(trigger.isAfter){
        if(trigger.isInsert){
        	List<Opportunity> opplist = new List<Opportunity>();
        	for(Account acc : Trigger.new){
                Opportunity opp = new Opportunity();
                opp.Name = acc.Name;
                opp.AccountId = acc.Id;
                opp.CloseDate = date.today();
                opp.StageName = 'Negotiation';
                opplist.add(opp);
        	}
            insert opplist;
        	System.debug('Opportunity list :: ' + opplist);
        }
    }
}
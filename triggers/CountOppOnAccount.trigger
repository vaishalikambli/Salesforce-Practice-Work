trigger CountOppOnAccount on Opportunity (after insert, after update, after delete) {
   list<account> acclist = new list<account>(); 
    set<id> idset = new set<id>();
 
    if (trigger.isafter){
        if(trigger.isinsert || trigger.isupdate || trigger.isundelete){
            for(opportunity opp: trigger.new){
                idset.add(opp.accountid);
                
            }   
        }
        if(trigger.isdelete){
            for(opportunity opp: trigger.old){
                idset.add(opp.accountid);
                
            }   
        }
        list<account> ac= [select id, name , Total_Contacts__c,(select id, name from Opportunities) from account where id in:idset ];
      /*  for(account acc:ac){
            acc.Total_Opportunity__c= acc.Opportunities.size();
            acclist.add(acc); 
        } 
         update acclist;  */
    }
   
}
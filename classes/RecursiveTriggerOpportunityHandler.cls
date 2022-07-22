public class RecursiveTriggerOpportunityHandler {
    public static void updateOpportunity(List<Opportunity> oppList){
      
     	List<Opportunity> UpdatedOpp = new List<Opportunity>();

        if(UtilFactory.checkRecursive()){
            for (Opportunity opp : oppList) {
                Opportunity op = new Opportunity();
                op.Id = opp.Id;
                op.LeadSource = 'Web';
                UpdatedOpp.add(op);
            }
            
            if(oppList != null){
                update UpdatedOpp;
                System.debug('Opportunity updated! ');
            }
  		}        
    }
}
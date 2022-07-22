trigger RecursiveTriggerOpportunity on Opportunity (after update) {
    RecursiveTriggerOpportunityHandler.updateOpportunity(Trigger.new);
}
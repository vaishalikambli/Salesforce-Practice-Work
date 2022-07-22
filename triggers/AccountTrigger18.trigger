trigger AccountTrigger18 on Account (before insert, before update, after insert) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            AccountTriggerClass18.initiateIndustry(Trigger.new);
        }else if(Trigger.isAfter){
            AccountTriggerClass18.createContact(Trigger.new);        
        }
    }
    
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            AccountTriggerClass18.compareAnnualRev(Trigger.new, Trigger.oldMap);
        }
    }
}
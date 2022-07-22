trigger AccountTrigger on Account (before insert) {
    for(Account ac: Trigger.New){
        ac.Industry = 'Other';
    }    
}
trigger SendEmailWhenContactCreated on Contact (after insert) {
    //Get list of contact's id
    Set<Id> conIds = new Set<Id>();    
    List<String> toAddresses = new List<String>();
    
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            for(Contact c : Trigger.new){
                conIds.add(c.Id);
            }
            Contact conList = [SELECT Id, Name, Email 
                               FROM Contact 
                               WHERE Id in : conIds
                              ];
            
            toAddresses.add(conList.Email);
            
            Messaging.SingleEmailMessage sendMail = new Messaging.SingleEmailMessage();
            sendMail.setToAddresses(toAddresses);
            
            String[] ccAddresses = new String[] {'vaishali_kambli2000@yahoo.com', 'vaishali.kambli1@outlook.com'};
            sendMail.setCcAddresses(ccAddresses);
            sendMail.setSenderDisplayName('New Contact - ' + conList.Name);
            sendMail.setSubject('New contact has been created');
            sendMail.setHtmlBody('Hi, This email is regarding that, new contact ' + conList.Name + ' has been created.');  
            //eList.add(sendMail);            

            //Send email to selected recipents          
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] {sendMail});                
                        
        }
    }
    
    
}
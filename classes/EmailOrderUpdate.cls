public class EmailOrderUpdate {
    public Id recordId{get;set;}
    public String toMail{get;set;}
    public String ccMail{get;set;}
    public String subjectBody{get;set;}
    public String emailBody{get;set;}
    public List<Opportunity_Line_Item__c> oppLineList{get;set;}
    public Opportunity oppOrd{get;set;}

    public EmailOrderUpdate(ApexPages.StandardSetController controller) {
        recordId = apexpages.currentpage().getparameters().get('id');        
        oppLineList = new List<Opportunity_Line_Item__c>();
        
        //Get selected Object's Id
        Map<Id, SObject> selectedItemId = new Map<Id, SObject>(controller.getSelected());
        
        oppLineList = [SELECT ID, Name, Opportunity_Name__c, Opportunity_Score__c, Order_Number__c, Order_Number_New__c, Price__c, Probability__c, Product_Name__r.Name, Quantity__c, Tracking_Number__c 
                       FROM Opportunity_Line_Item__c 
                       WHERE ID IN :selectedItemId.keyset()
                      ];
        
         for(Opportunity_Line_Item__c opp : oppLineList){
            subjectBody = 'Your order confirmation #' + opp.Name;
            
            emailBody = ('<h1 style="text-align:center">' + 'Thank you for your order!' + '</h1>' + '<hr />' + 
                		 '<h2 style="text-align:center">' + 'Order Confirmation' + '</h2>' + '<hr />' + 
                         '<p>' + 'Hi There,' + '</p>' + 
                         '<p>' + 'We\'ll send you a Shipping Confirmation email when your items ship.' + '</p>'
                        );
            
            emailBody += '<table border="1" style="border-collapse: collapse;" cellspacing="20" cellpadding="20"><thead><th>Product</th><th>Quantity</th><th>Price</th></thead><tbody>';
            
            for(Integer Count = 0; count < oppLineList.size(); count++){
                emailBody += '<tr><td>' + oppLineList[count].Product_Name__r.Name + '</td>' +
                             '<td>' + oppLineList[count].Quantity__c + '</td>' + 
                             '<td>' + oppLineList[count].Price__c + '</td></tr>';
            }            
            emailBody += '</tbody></table>';
            emailBody += '<p>' + 'For any query, You can speak to our Customer Care Team between 10am-7pm (All days) Indian Standard Time (IST).' + '</p>';
            emailBody += '<p style="padding:0; margin:0;">' + 'Thank you,' + '</p>' + '<strong>Team Samartha Solutions</strong>';
        }      
    }
    
    public PageReference sendEmail(){      
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        String[] toAddresses = toMail.split(',');
        String[] ccAddresses = ccMail.split(',');
        
        for(Integer count = 0; count < toAddresses.size(); count++){
            if(toAddresses[count].contains('@'))
            	mail.setToAddresses(toAddresses);            
        }
        
        for(Integer count = 0; count < ccAddresses.size(); count++){
            if(ccAddresses[count].contains('@'))
                mail.setCcAddresses(ccAddresses);
        }
        
        mail.setSenderDisplayName('Samartha Solutions');
        mail.setSubject(subjectBody);
        mail.setHtmlBody(emailBody);
        
        //Send email to selected recipents
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
            
        return new PageReference('/' + recordId);        
    }
}
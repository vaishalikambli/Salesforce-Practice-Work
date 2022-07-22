public class SalesOrderLineItem {   
    //public ApexPages.StandardSetController standardController;
    
    public Id recordId{get;set;}
    public String toMail{get;set;}
    public String ccMail{get;set;}
    public String subjectBody{get;set;}
    public String emailBody{get;set;}
    public List<String> emailLi{get;set;}
    public List<Opportunity_Line_Item__c> oppLineList{get;set;}
    public Opportunity oppOrd{get;set;}

   /* public SalesOrderLineItem(ApexPages.StandardSetController controller) {
        this.standardController = standardController;
        
        for(Sales_Order_Line_Item__c saleOrdIt : (List<Sales_Order_Line_Item__c>)standardController.getSelected()){
            selectedIds.add(saleOrdIt.Name);
            System.debug('Sales order line item Id -- ' + saleOrdIt);
        }

                Map<Id, SObject> selectedSaleOrdLn = new Map<Id, SObject>(controller.getSelected());
            
    

        recordId = apexpages.currentpage().getparameters().get('id');
        System.debug('Record ID -- ' + recordId);
        
        saleOrd = [SELECT Id, Contact_Email__c, Account_Name__r.Name, Contact_Name__r.Name 
                   FROM Sales_Order__c  
                   WHERE Id =: recordId
                  ];
        System.debug('Sales order -- ' + saleOrd);
        saleOrdIt = [SELECT Id, Name, Sales_Orderc__c, Contact__c, Invoiced_Quantity__c, Unit_Price__c, Product_Name__c 
                                         FROM Sales_Order_Line_Item__c 
                     WHERE Id =: selectedSaleOrdLn.keySet()
                    ];
        System.debug('Sales order line item -- ' + saleOrdIt);
                System.debug('Selected Ids are here -- ' + selectedSaleOrdLn); 
        
        //Email-list
        emailLi = new List<String>();
        emailLi.add('vaishali.kambli1@outlook.com');
        emailLi.add('ishani.ajgaonkar@gmail.com');
        
        for(String e : emailLi){
            if(ccMail != Null)
                ccMail = ccMail + ', ' + e;
            else
                ccMail = e;            
        }
        
        for(Sales_Order_Line_Item__c sol : saleOrdIt){
            subjectBody = 'Status of your order - ' + sol.Name;
            
            emailBody = ('<strong>' + 'Order status detail' + '</strong><br /><br />' + 
                         'Thank you for shopping with us!' + '<br />' +
                         'We are happy to inform you that your order' + sol.Name + 'has been received and is under processing.' + '<br />' +
                         'You can check the status of your order by' + '<br />' + 
                         '<strong>' + 'Account Name : ' + sol.Account_Name__c + '</strong><br />'                         
                        );
            
            emailBody += '<table border="1" style="border-collapse: collapse;" cellspacing="20" cellpadding="20"><tr><th>Product</th></tr><tr><th>Quantity</th></tr><tr><th>Description</th></tr></table>';
            
            for(Integer Count = 0; count < saleOrdIt.size(); count++){
                emailBody += '<tr><td>' + saleOrdIt[count].product_name__c + '</td></tr>' +
                             '<tr><td>' + saleOrdIt[count].Invoiced_Quantity__c + '</td></tr>' + 
                                 '<tr><td>' + saleOrdIt[count].Product_Description__c + '</td></tr><br />';
            }
            
            emailBody += '</table><br />';
            emailBody += 'You can speak to our Customer Care Team between 10am-7pm (All days) Indian Standard Time (IST).';
            emailBody += 'Thank you<br /><strong>Team Samrtha Solutions</strong>';
        }
    }*/
    
    /*public PageReference sendEmail(){
        String[] toEmailVal = toMail.split(',');
        String[] ccMailVal = ccMail.split(',');
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        for(Integer count = 0; count < toEmailVal.size(); count++){
            if(toEmailVal[count].contains('@')){
                mail.setToAddresses(toEmailVal);
            }
        }
        
        for(Integer count = 0; count < ccMailVal.size(); count++){
            if(ccMailVal[count].contains('@')){
                mail.setCcAddresses(ccMailVal);
            }
        }
        
        mail.setSenderDisplayName('Samartha Solutions');
        
        for(Integer count = 0; count < saleOrdIt.size(); count++){
            mail.setWhatId(saleOrdIt[count].Id);
        }
        mail.setSubject(subjectBody);
        mail.setHtmlBody(emailBody);
        
        try{
            Messaging.SendEmailResult[] resultMail = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }catch(System.EmailException ex){                            
        }
        
        return new PageReference('/' + recordId); 
    }*/
    
    public SalesOrderLineItem(ApexPages.StandardSetController controller) {
        recordId = apexpages.currentpage().getparameters().get('id');
        System.debug('Record ID -- ' + recordId);
        
        oppLineList = new List<Opportunity_Line_Item__c>();
        
        Map<Id,SObject> selectedItemId = new Map<Id,SObject>(controller.getSelected());
        
        oppLineList = [SELECT Id, Name, Opportunity_Name__c, Opportunity_Score__c, Order_Number__c, Probability__c, Product_Name__c, Quantity__c, Tracking_Number__c
                       FROM Opportunity_Line_Item__c
                       WHERE Id IN : selectedItemId.keyset()
                      ];
        
         for(Opportunity_Line_Item__c opp : oppLineList){
            subjectBody = 'Status of your order - ' + opp.Name;
            
            emailBody = ('<strong>' + 'Order status detail' + '</strong><br /><br />' + 
                         'Thank you for shopping with us!' + '<br />' +
                         'We are happy to inform you that your order' + opp.Name + 'has been received and is under processing.'
                        );
            
            emailBody += '<table border="1" style="border-collapse: collapse;" cellspacing="20" cellpadding="20"><tr><th>Product</th></tr><tr><th>Quantity</th></tr><tr><th>Description</th></tr>';
            
            for(Integer Count = 0; count < oppLineList.size(); count++){
                emailBody += '<tr><td>' + oppLineList[count].product_name__c + '</td></tr>' +
                             '<tr><td>' + oppLineList[count].Quantity__c + '</td></tr>' + 
                             '<tr><td>' + oppLineList[count].Tracking_Number__c + '</td></tr>';
            }            
            emailBody += '</table><br />';
            emailBody += 'You can speak to our Customer Care Team between 10am-7pm (All days) Indian Standard Time (IST).';
            emailBody += 'Thank you,<br /><strong>Team Samartha Solutions</strong>';
        }
        
    }
    
    public PageReference sendEmail(){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'vaishali.kambli1@outlook.com'};
        String[] ccAddresses = new String[] {'vaishali_kambli@outlook.com'};
        mail.setToAddresses(toAddresses);
        mail.setCcAddresses(ccAddresses);
        mail.setReplyTo('ajgaonkar1@gmail.com');
        mail.setSenderDisplayName('Samartha Solutions');
        mail.setSubject(subjectBody);
        mail.setHtmlBody(emailBody);
            
        return new PageReference('/' + recordId);        
    }
    
    
}
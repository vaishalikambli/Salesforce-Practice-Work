public class EmailWithSetController {

    public EmailWithSetController(ApexPages.StandardSetController controller) {
                System.debug('in StandardSetController' );
    }

    public Id recordId{get;set;}
    public String toMail{get;set;}
    public String ccMail{get;set;}
    public String subjectBody{get;set;}
    public String emailBody{get;set;}
    public User userDetails{get;set;}
    public List<String> emailLi{get;set;}
    public List<Sales_Order_Line_Item__c> saleOrdIt{get;set;}
    public List<Contact> toAddress{get;set;}
    public Sales_Order__c saleOrd{get;set;}

    public EmailWithSetController (ApexPages.StandardController controller) {
        Map<Id,SObject> selectedItemId = new Map<Id,SObject>(); 
        System.debug('in StandardController' );
    }

}
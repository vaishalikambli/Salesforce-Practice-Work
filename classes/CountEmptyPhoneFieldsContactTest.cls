@isTest
public class CountEmptyPhoneFieldsContactTest {
    
    @isTest
    public static void getAllEmptyPhoneFields(){
        Contact con = new Contact();
        con.LastName = 'Deshpande';
        con.Phone = '';
            
        insert con;
        
        Test.startTest();
        CountEmptyPhoneFieldsContact.getCountEmptyPhones();
        Test.stopTest();
        
        List<Contact> contactsList = [SELECT LastName FROM Contact WHERE phone = null];
                System.debug('Contact list :: ' + contactsList);
        for(Contact c : contactsList){
            System.assertEquals('Deshpande', c.LastName);
        }
    }
}
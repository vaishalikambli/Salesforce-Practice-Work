/**
Write a class that return no. of all the empty phone number field in contacts and write the test class for it.
*/

public class CountEmptyPhoneFieldsContact {
    //Method to get count of empty phone number fields
    public static void getCountEmptyPhones(){
        Integer contactList = [SELECT COUNT() FROM contact WHERE Phone = null ];
        System.debug('No. of empty phone fields' + contactList);
    }
}
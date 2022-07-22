//Whenever accont created contact should create same time

public class AccountTriggerClass18 {
    public static void initiateIndustry(List<Account> accobj){
        for(Account acc : accobj){
            if(acc.Industry != null)
                acc.Industry = 'Banking';
        }
    }
    
    Public static void createContact(List<Account> accobj){
        List<Contact> conlist = new List<Contact>();
        
        for(Account acc : accobj){
            Contact con = new Contact();
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            con.Department = 'HR';
            conlist.add(con);
        }
        insert conlist;
        System.debug('Contact list :: ' + conlist);
    }
    
    Public static void compareAnnualRev(List<Account> accobj, Map<Id, Account> oldacc){
        for(Account acc : accobj){
            if(oldacc != null && acc.AnnualRevenue != oldacc.get(acc.Id).AnnualRevenue)
                acc.Description = 'You changed Annual revenue';
        }
    }
}
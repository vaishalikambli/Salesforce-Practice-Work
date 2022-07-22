public class Accconopp {
    Public Account acc{get; set;}
    Public Contact con{get; set;}
    Public Opportunity opp{get; set;}
  
    Public Accconopp() {
        acc = new Account();
        con = new Contact();
        opp = new Opportunity();
    }
    
    Public PageReference SaveAccconopp(){
        insert acc;
        
        con.AccountId = acc.id;
        opp.AccountId = acc.Id;
        
        insert con;
        insert opp;
        
        PageReference pr = new PageReference('/' + acc.Id);
        
        return pr;
    }
    
    Public PageReference CancelAccconopp(){
        
        //PageReference prcan = new PageReference('/');
        
        return Null;
    }
}
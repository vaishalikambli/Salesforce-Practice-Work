Public Class CustomCntrl {
  	Public Account acc{get; set;}
  
    Public CustomCntrl() {
        acc = new Account();
        acc.Name = 'Raymond Richard';
        acc.Industry = 'Banking';      
    }
    
    Public Void SaveAcc(){
        insert acc;
    }
    
    
}
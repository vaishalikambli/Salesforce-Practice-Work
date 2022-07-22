public class newIncentivePlan {
    public String SelectedIncType {get; set;}
    public Decimal TotalAmount {get; set;}
    Public Incentive__c incentiveData {get;set;}
    Public List<Incentive__c> incentiveList{get;set;}    
    public Decimal IncentiveAmount;
    public String incName;
    String incNameFormat;
    
    Public newIncentivePlan(){
        incentiveData = new Incentive__c();
        incentiveList = new  List<Incentive__c>();
    }    

    public void getSelectedIncentiveType(){
        SelectedIncType = incentiveData.Incentive_Type__c;
    }
    
    public PageReference SaveIncentive() {
        PageReference pr = new PageReference('/');        
        
        Date currentDate = Date.today();
        Integer monthVal = currentDate.month();
        System.debug('Month value -- ' + monthVal);
        
        TotalAmount = incentiveData.Total_Amount__c;		
        incNameFormat = '2022 - ' + SelectedIncType + ' - ' + incentiveData.Name;
        
        Incentive__c parentIncRecord = new Incentive__c(Name = incNameFormat,
                                                  		Incentive_Type__c = SelectedIncType,
                                                        Date__c = incentiveData.Date__c,
                                                  		Total_Amount__c = incentiveData.Total_Amount__c        
        												);        
        insert parentIncRecord;        
        
        //Map for list of months
        Map<Integer, String> monthNameByMonthNumber = new Map<Integer, String>();
            monthNameByMonthNumber.put(1, 'January');
            monthNameByMonthNumber.put(2, 'February');
            monthNameByMonthNumber.put(3, 'March');
            monthNameByMonthNumber.put(4, 'April');
            monthNameByMonthNumber.put(5, 'May');
            monthNameByMonthNumber.put(6, 'June');
            monthNameByMonthNumber.put(7, 'July');
            monthNameByMonthNumber.put(8, 'August');
            monthNameByMonthNumber.put(9, 'September');
            monthNameByMonthNumber.put(10, 'October');
            monthNameByMonthNumber.put(11, 'November');
            monthNameByMonthNumber.put(12, 'December');
        
        //Incentive type - Monthly
		if(SelectedIncType == 'Monthly'){
            TotalAmount /= 12;           
            
            for(Integer count = 0; count < 12; count++){
                incName = incNameFormat + ' - ' + (count+1);                
                
				incentiveData = New Incentive__c (Incentive__c = parentIncRecord.id,
                    							  Name = incName,
                                                  Incentive_Type__c = SelectedIncType,
                                                  Month_Name__c = monthNameByMonthNumber.get(count+1),
                                                  Total_Amount__c = TotalAmount
                                                 );
                incentiveList.add(incentiveData);                
            }           
        	insert incentiveList;
            
        //Incentive type - Quarterly
		}else if(SelectedIncType == 'Quarterly'){
            Integer countQ = 1;
            TotalAmount /= 4;
            
            for(Integer count = 0; count < 4; count++){
                incName = incNameFormat + ' - ' + (count+1);

				incentiveData = New Incentive__c (Incentive__c = parentIncRecord.id,
                    							  Name = incName, 
                                                  Incentive_Type__c = SelectedIncType,
												  Quater_Name__c = monthNameByMonthNumber.get(countQ),                                                  
                                                  Total_Amount__c = TotalAmount                                                  
                                                 );
                incentiveList.add(incentiveData);
                countQ += 3;
            }
         	insert incentiveList;
        }
        return pr;
    }
    
    public PageReference CancelIncentive() {
        PageReference pr = new PageReference('/');       
        return pr;
    }
}
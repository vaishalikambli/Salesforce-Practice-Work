public class Employee {
    public Integer Empid;
    public String Name;
    public Integer Contactno;
    public String Address;
    public String Email;
    public String Identificationno;
    public String Gender;
    public Decimal CurrentSalary;
    public Date DOB;
    
    //Constructor defination
    Public Employee(){
        System.debug('First Constructor');
    }
    
    Public Employee(Integer a){
        System.debug('Second Constructor');
    }
    
    Public Employee(Decimal b, Decimal c){
        System.debug('Third Constructor');
    }
    
    Public Employee(Decimal d, String e){
        System.debug('Fourth Constructor');
    }
    
    //Method without output
   /* Public Void IncentiveCalculation() {
        //Local variable - access with class
        decimal incentive = 10000;
        
        incentive = CurrentSalary + incentive;
        
        System.debug('Total Salary - ' + incentive);
    }*/
    
    Public Decimal IncentiveCalculation(Decimal CurrentSalary) {
        //Local variable - access with class
        decimal incentive;
        
        incentive = CurrentSalary + 1000;
        
        System.debug('Total Salary - ' + incentive);
        
        return incentive;
    }
    
    //Substract
    //Multiply
    //Devide
    //Percentage(40)
    
}
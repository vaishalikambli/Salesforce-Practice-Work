public class addRemoveField {

    public String studentNameField { get; set; }
    Public List<String> studentList {get;set;}
    
    //Constructor
    public addRemoveField(){
        studentList = new list<String>();
        studentNameField = 'Please enter student name';
    }
     
    //Function for Add student in a table
    public void addStudent(){
        studentList.add(studentNameField);
        studentNameField = '';
    }
    
    //Remove student record
    public void removeStudent(){ 
        studentList.remove(studentList.size()-1);    
    } 
 
}
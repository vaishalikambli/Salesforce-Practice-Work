public class SchedulablePracticeClass implements Schedulable{
    public void execute(SchedulableContext sc) {
        List<Contact> conList = [SELECT id, LeadSource FROM Contact];
        for (Contact cc : conList) {
            cc.LeadSource = 'Web';
        }
        Update conList;
    }
}

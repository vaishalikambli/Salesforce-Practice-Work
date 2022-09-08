public class FirstQueuableClass implements Queueable{
    public void execute(QueueableContext q){
        System.debug('First Queuable Class!!!');
        system.enqueueJob(new SecondQueuableClass());
    }
}
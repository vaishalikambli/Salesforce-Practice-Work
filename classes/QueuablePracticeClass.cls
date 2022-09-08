public class QueuablePracticeClass implements Queueable{ 
    public void execute(QueueableContext q){
        System.debug('Queuable Practice Class!!!');
        System.enqueueJob(new FirstQueuableClass());
    }
}

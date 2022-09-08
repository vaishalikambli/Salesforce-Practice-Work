/**
 * Description - Count total number of students of parents whwnever new child/student added/updated or deleted under parent object  
 */

trigger CountStudentsOnParent on Student__c (after insert, after update, after delete) {
    List<Parent__c> updatedList = new List<Parent__c>();
    Set<Id> parentIds = new Set<Id>(); 
    
    if(trigger.isAfter){
        if(trigger.isInsert || trigger.isUpdate){
            for(Student__c st : trigger.new){
                parentIds.add(st.ParentName__c);
            }
        }
        
        if(trigger.isDelete){
            for(Student__c st : trigger.old){
                parentIds.add(st.ParentName__c);
            }
        }
        
        List<Parent__c> parentsList = [SELECT id, name, (SELECT id, name FROM Students__r) FROM Parent__c WHERE id =: parentIds];
        Integer studList = [SELECT COUNT() FROM Student__c WHERE ParentName__c =: parentIds];
        System.debug('studList :: ' + studList);

        for(Parent__c pr : parentsList){
            Integer totalParents = pr.Students__r.size();
            System.debug('Parent ' + pr.name + ' -- total kids' + totalParents);
        }        
    }
}
/*
Write a trigger only the system admin user should be able to delete the task.
**/
trigger DeleteTaskSA on Task (before delete) {
    
    Id currentUserProfileId = Userinfo.getProfileId();
    String userProfileName = [SELECT Id, Name 
				   	   		  FROM Profile 
                       		  WHERE Id =: currentUserProfileId
                  	  		 ].Name;
    
    if(Trigger.IsBefore){        
        if(Trigger.IsDelete){
            System.debug('Trigger old :: ' + Trigger.oldMap);
            for(Task t : Trigger.old){
                System.debug('Inner Trigger old :: ' + Trigger.old);  
                if(userProfileName != 'System Administrator')
                    t.addError('You don\'t have access to delete this task!');                
            }        
        }
    }
}
//Whenever new contact created append with Account name 
trigger ContactWithAccountName on Contact (before insert) {

	Set<Id> accountIds = new Set<Id>();
	for(Contact c : trigger.new) {
		if(c.AccountId != Null) { 
			accountIds.add(c.AccountId);
		}
	}

	if (accountIds.size() > 0){
		Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id, Name FROM Account WHERE Id IN :accountIds]);

		for(Contact c : trigger.new){
			c.LastName = c.LastName + ' ' + accountMap.get(c.AccountId).Name;
		}
	}

}
public class ContactTriggerHandler {
	public static void updateAccountField(List<Contact> conList){
		set<Id> accId = new set<Id>();
		for(Contact con : conList){
			accId.add(con.AccountId);
		}
		
		Map<Id, Account> allAccMap = new map<Id, Account>([SELECT Id, Number_of_Student__c, No_of_Teacher__c FROM Account WHERE Id IN: accId]);

		Map<Id, Contact> allConMap = new map<Id, Contact>([SELECT Id, isStudent__c, AccountId FROM Contact WHERE AccountId IN: allAccMap.Keyset()]);
		
		List<Account> updateAccount = new List<Account>();
		
		Map<Id , List<Contact>> accIdContactMap = new map<Id, List<Contact>>();
		
		for(Id conId : allConMap.Keyset()){
			
			if(!accIdContactMap.containsKey(allConMap.get(conID).AccountId)){
				accIdContactMap.put(allConMap.get(conID).AccountId, new List<Contact>());
			}
			
			accIdContactMap.get(allConMap.get(conID).AccountId).add(allConMap.get(conID));
		}
		
		for(ID acId :accIdContactMap.Keyset()){
		Account acc = new Account();
		integer stu = 0;
		integer tech = 0;
			for(Contact con : accIdContactMap.get(acId)){
				
				if(con.isStudent__c == true){
					stu = stu + 1;
				}
				else{
					tech = tech +1;
				}
			}
            acc.id = acId;
			acc.Number_of_Student__c = stu;
			acc.No_of_Teacher__c = tech;
			
			updateAccount.add(acc);
		}
		
		update updateAccount;
		
	}
}
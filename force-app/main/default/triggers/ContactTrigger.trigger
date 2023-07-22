trigger ContactTrigger on Contact (after insert,after update, after delete, after undelete) {
    
    if(Trigger.isInsert){
		ContactTriggerHandler.updateAccountField(trigger.New);
    }
    
    if(Trigger.isUpdate){
        List<Contact> conList = new List<Contact>(trigger.New);
        conList.addAll(trigger.Old);
        ContactTriggerHandler.updateAccountField(conList);
    }
		
	if(Trigger.isDelete){
		ContactTriggerHandler.updateAccountField(trigger.Old);
	}
}
trigger Object2Trigger on Object2__c (after undelete) {
	Object2TriggerHandler.updateObject1(Trigger.New);
}
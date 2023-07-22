trigger StudentTrigger on Student__c (after insert, after update) {
	StudentTriggerHandler.updateStudentAssisment(Trigger.New);
}
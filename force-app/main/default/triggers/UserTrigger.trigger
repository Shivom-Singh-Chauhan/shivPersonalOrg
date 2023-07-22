trigger UserTrigger on User (after insert) {
    system.debug('in user trigger');
	UserTriggerHandler.givingPrimetion(trigger.New);
}
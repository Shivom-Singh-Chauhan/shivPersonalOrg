trigger CampaignTrigger on Campaign (after update) {
	system.debug('Old Map>'+Trigger.OldMap);
    system.debug('New Map>'+Trigger.NewMap);
}
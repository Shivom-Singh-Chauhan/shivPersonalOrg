trigger CampaignMemberTrigger on CampaignMember (after update, Before Update) {
		system.debug('Old Map>'+Trigger.OldMap);
    	system.debug('New Map>'+Trigger.NewMap);
}
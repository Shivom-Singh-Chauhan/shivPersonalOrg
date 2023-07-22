trigger OpportunityLineItemTrigger on OpportunityLineItem (after insert, after update, after delete) {
    
    
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
        
        OpportunityLineItemHandler.updateAccountField(Trigger.NewMap);
    }
    
    if(Trigger.isAfter &&  Trigger.isDelete){
        
        OpportunityLineItemHandler.updateAccountField(Trigger.OldMap);	
    }
    
}
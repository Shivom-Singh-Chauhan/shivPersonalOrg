public class OpportunityLineItemHandler{

	public static void updateAccountField (Map<Id,OpportunityLineItem> lineItemMap){
		
		set<Id> productIds = new set<Id>();
		for(OpportunityLineItem oli : lineItemMap.values()){
			productIds.add(oli.Product2Id);
		}
		
		set<Id> OpportunityIds = new set<Id>();
		for(OpportunityLineItem oli : lineItemMap.values()){
			OpportunityIds.add(oli.OpportunityId);
		}
		
		Map<Id,Opportunity> oppMap = new Map<Id,Opportunity>([Select Id, AccountId From Opportunity WHERE Id IN: OpportunityIds]);
        
        set<Id> AccountIds = new set<Id>();
		for(Opportunity oli : oppMap.values()){
			OpportunityIds.add(oli.AccountId);
		}
        
        Map<Id,Opportunity> allOppMap = new Map<Id,Opportunity>([Select Id, AccountId From Opportunity WHERE AccountId IN: AccountIds]);
        
        Map<Id,OpportunityLineItem> allLineItemMap = new Map<Id,OpportunityLineItem>([Select Id,Product2Id, OpportunityId, Quantity From OpportunityLineItem WHERE OpportunityId IN:allOppMap.keyset()]);
		
		Map<Opportunity, List<OpportunityLineItem>> oppVsOliMap = new Map<Opportunity, List<OpportunityLineItem>>();
		
		
		
		Map<Opportunity , Double> minQuantityProductForOpp = new Map<Opportunity , Double>();
		
		
		
		
		for(Id oppId : oppMap.Keyset()){
			for(Id OliId : allLineItemMap.Keyset()){
				
				if(!oppVsOliMap.ContainsKey(oppMap.get(oppId)))
					oppVsOliMap.put(oppMap.get(oppId), new List<OpportunityLineItem>());
					
				if(oppid == allLineItemMap.get(OliId).OpportunityId)	
					oppVsOliMap.get(oppMap.get(oppId)).add(allLineItemMap.get(OliId));
			}
		}
		
		
		
		
		
		
		for(Opportunity opp : oppVsOliMap.keyset()){
		
			Map<Id, Double> proQuantity = new Map<Id, Double>();
			
				for(OpportunityLineItem oli : oppVsOliMap.get(opp)){
				
					if(!proQuantity.ContainsKey(oli.Product2Id)){
						proQuantity.put(oli.Product2Id, oli.Quantity);
						}
						else
						{
							proQuantity.put(oli.Product2Id, proQuantity.get(oli.Product2Id) + oli.Quantity);
						}
				}
            system.debug(proQuantity);
				 
				Double minimun = 100000;
				 
				for(Id proId : proQuantity.Keyset()){
					if(minimun > proQuantity.get(proId))
						minimun = proQuantity.get(proId);
				}
				
				minQuantityProductForOpp.put(opp, minimun);
            system.debug(minQuantityProductForOpp);
			}
		
		
			set<Id> AccountId = new set<Id>();
				for(Id oppId : oppMap.Keyset()){
					AccountId.add(oppMap.get(oppId).AccountId);
				}
				
				
		List<Account> accList = [Select Id , totalQuanityOfMinProduct__c From Account Where Id IN : AccountId];
		
		
		List<Account> updatedAccList =  new List<Account>();
		for(Account acc : AccList){
			Double updatedValue = 0 ;
			for(Opportunity opp : minQuantityProductForOpp.keyset()){
				
				if(opp.AccountId == acc.Id){
					updatedValue = updatedValue + minQuantityProductForOpp.get(opp);
				}
			}
			
			acc.totalQuanityOfMinProduct__c = updatedValue;
			updatedAccList.add(acc);
		}
			
		update updatedAccList;		
		}
		
		
}
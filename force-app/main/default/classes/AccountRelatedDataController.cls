public class AccountRelatedDataController {
    @AuraEnabled
    public static AccountDataWrap sendData() {
        
        List<Field_set__mdt> contactFieldSet = [SELECT Field_Set__c FROM Field_set__mdt WHERE Object_Api_Name__c='Contact'];
        List<Field_set__mdt> opportunityFieldSet = [SELECT Field_Set__c FROM Field_set__mdt WHERE Object_Api_Name__c='Opportunity'];
        AccountDataWrap data = new AccountDataWrap();
        data.accList = new Map<Id,Account>([SELECT Id, Name,Revenue_generated_from_opportunity__c, Revenue_genrated_from_contact__c, Gross_Revenue__c FROM Account]);
       /* Map<Id, List<Contact>> accConMap = new Map<Id, List<Contact>>();
        Map<Id, List<Opportunity>> accOppMap = new Map<Id, List<Opportunity>>();
        
        
        
        for(Contact con : Database.query('SELECT '+ contactFieldSet[0].Field_Set__c + ' FROM Contact WHERE AccountId != null')) {
            if(!accConMap.containsKey(con.AccountId))
            	accConMap.put(con.AccountId, new List<Contact>());
            accConMap.get(con.AccountId).add(con);
        }
        data.accountContactMap = accConMap;
        
        for(Opportunity opp : Database.query('SELECT '+ opportunityFieldSet[0].Field_Set__c + ' FROM Opportunity WHERE AccountId != null')) {
            if(!accOppMap.containsKey(opp.AccountId))
            	accOppMap.put(opp.AccountId, new List<Opportunity>());
            accOppMap.get(opp.AccountId).add(opp);
        }
        data.accountOpportunityMap = accOppMap; */
        
        data.contactList = Database.query('SELECT '+ contactFieldSet[0].Field_Set__c + ' FROM Contact WHERE AccountId != null');
        data.opportunityList = Database.query('SELECT '+ opportunityFieldSet[0].Field_Set__c + ' FROM Opportunity WHERE AccountId != null');
        
        system.debug(''+data);
        return data;
    }
    @AuraEnabled
    public static void updateData(sObject dataToUpdate){
        try{
       
             system.debug(dataToUpdate);
        Database.SaveResult sr = database.update(dataToUpdate, false);
            system.debug(sr);
        }catch(exception ex){
            system.debug(ex.getMessage());
        }
    }
    
    @AuraEnabled
    public static void deleteData(sObject dataTodelete){
        try{
       
             system.debug(dataTodelete);
      database.delete(dataTodelete, false);
      
        }catch(exception ex){
            system.debug(ex.getMessage());
        }
    }
	
    public class AccountDataWrap {
        @AuraEnabled
        public Map<Id,Account> accList;
        @AuraEnabled
        public List<Contact> contactList;
        @AuraEnabled
        public List<Opportunity> opportunityList;
        @AuraEnabled
        public Map<String, String> contactFieldSet;
        @AuraEnabled
        public Map<String, String> oppoertunityFieldSet;        
    } 
}
public with sharing class GetContactFromAccount {
    public GetContactFromAccount() {

    }
    @AuraEnabled(Cacheable = true)
    public static List<Contact> getContact(String accountName){
        try {
            Account acc = [SELECT ID ,Name From Account WHERE Name = :accountName];
            List<Contact> conList = [SELECT ID, Name,Email From Contact WHERE AccountId = : acc.Id];
            system.debug('conList'+conList);
            return conList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
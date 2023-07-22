public class FetchContact {
    @AuraEnabled(cacheable=true)
    public static List<Contact>  getContact(){
        try {
            List<Contact> conList = [SELECT Id,Name FROM Contact];
            return conList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    public FetchContact() {}
}
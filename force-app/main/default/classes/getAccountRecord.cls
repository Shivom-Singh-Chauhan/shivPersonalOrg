public class getAccountRecord {
    @AuraEnabled
    public static List<Account> getAccount(string searchName){
        string searchNamefull = '%' + searchName + '%';
        List<Account> accList = [SELECT Id,Name FROM Account WHERE Name LIKE :searchNamefull];

        System.debug(accList);

        return accList;
    }

    @AuraEnabled
    public static void setAccount(List<Account> accList){
       update accList;
    }
}
public class UpdateEmailInAccount {
    public static void updateEmailInAccount(List<Contact> conList){
        
        set<Id> accId = new set<Id>();
        for(Contact con: conList)
            accId.add(con.AccountID);
        
        List<Account> accList = [Select Id, ContactEmail__c From Account Where Id IN :accId];
        
        map<Account, List<Contact>> accVSConMap = new map<Account, List<Contact>>();
        
        for(Account acc: accList){
            for(Contact con: conList){
                if(!accVSConMap.containsKey(acc)){
                    accVSConMap.put(acc,new List<Contact>());
                }
                accVSConMap.get(acc).add(con);
            }
        }
        List<Account> updatedAccountList = new List<Account>();
        for(Account acc: accVSConMap.keySet()){
            for(Contact con: accVSConMap.get(acc)){
                if(acc.ContactEmail__c != null){
                    if(!acc.ContactEmail__c.Contains(con.Email))
            		acc.ContactEmail__c = acc.ContactEmail__c + ',' + con.Email;
                }else{
                    acc.ContactEmail__c =con.Email;
                }
                
            }
            updatedAccountList.add(acc);
        }
        update updatedAccountList;
    }
    
    public static void deleteEmailInAccount(List<Contact> conList){
        set<Id> accId = new set<Id>();
        for(Contact con: conList)
            accId.add(con.AccountID);
        
        List<Account> accList = [Select Id, ContactEmail__c From Account Where Id IN :accId];
        
        map<Account, List<Contact>> accVSConMap = new map<Account, List<Contact>>();
        
        for(Account acc: accList){
            for(Contact con: conList){
                if(!accVSConMap.containsKey(acc)){
                    accVSConMap.put(acc,new List<Contact>());
                }
                accVSConMap.get(acc).add(con);
            }
        }
        List<Account> updatedAccountList = new List<Account>();
        for(Account acc: accVSConMap.keySet()){
            for(Contact con: accVSConMap.get(acc)){
                if(acc.ContactEmail__c != null){
                    if(acc.ContactEmail__c.Contains(con.Email)){
                        acc.ContactEmail__c = acc.ContactEmail__c.remove(con.Email);
                        system.debug('in if');
                    }
            		
                }
                system.debug(acc.ContactEmail__c);
                system.debug(con.Email);
            }
            updatedAccountList.add(acc);
        }
        update updatedAccountList;
    }
}
public class LearningWithSaloni {
    public static void lecture1()
    {
        List<Account> accList = [SELECT Id, Name, FirstName, Type, MasterRecordId FROM Account LiMIT 10];
        List<Contact> coinList = new List<Contact>();
        for(integer  x = 0;x<11;x++){
            for(Account acc :accList){
                contact con = new contact();
                con.LastName = 'Bakshi SuperWomen'+ x;
                con.AccountId = acc.Id;
                coinList.add(con);
                    }
            
        }
        insert coinList;
        
    }
}
public class Batchchainingtest implements Database.Batchable<sobject> {
    public Database.DeleteResult[] drList;
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        return null;

    }
    public void execute(Database.BatchableContext bc,list<Account>acc)
    {   
        system.debug(acc);
      //  Database.delete(acc);
    }
    public void finish(Database.BatchableContext bc)
    {
       
    }

}
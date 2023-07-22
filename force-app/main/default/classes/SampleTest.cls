@isTest  
private class SampleTest {  
    static testMethod void testSetCreatedDate() {  
        Account acc = new Account(Name='Test Account', User_Email__c='test@test.com');  
        Insert acc;
        Datetime yesterday = Datetime.now().addDays(-1);
        Test.setCreatedDate(acc.Id, yesterday);  
        system.debug(acc.CreatedDate);
        Test.startTest();  
        Account testAcc = [SELECT Id, Name, CreatedDate FROM Account WHERE Name ='Test Account' LIMIT 1];
        system.debug(acc.CreatedDate);
        System.assertEquals(testAcc.CreatedDate, yesterday);  
        Test.stopTest();  
    }  
}
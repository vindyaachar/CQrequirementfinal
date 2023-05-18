@isTest
public class createcontactonaccountnsertion {
     @isTest
   public static void inserAccount() {
        Account acc = new Account ();
        acc.Name = 'Test account';
        acc.Active__c = true;
        acc.Type = 'Customer - Direct';
        acc.Company_Email__c = 'Test@gmail.com';
        acc.Phone = '123456791';
        acc.Account_activation_summary__c ='test';
        insert acc;
        List<Contact> conList = new List<Contact>([Select Id, AccountId From Contact Where AccountId =:acc.Id]); 
        System.debug('conlst'+conList.size());
        System.assertEquals(1, conList.size());
    }
    @isTest
   public static void updateAccount() {
        Account acc = new Account ();
        acc.Name = 'Test account';
        acc.Type = 'Customer - Direct';
        acc.Company_Email__c = 'Test@gmail.com';
        acc.Phone = '123456791';
        insert acc;
        List<Contact> conList = new List<Contact>([Select Id, AccountId From Contact Where AccountId =:acc.Id]); 
        System.debug(conList.size());
        System.assertEquals(0, conList.size());
        acc.Active__c = true;
        acc.Account_activation_summary__c ='test';
        update acc;
        List<Contact> conList1 = new List<Contact>([Select Id, AccountId From Contact Where AccountId =:acc.Id]); 
        System.debug(conList1.size());
        System.assertEquals(1, conList1.size());
    }
}
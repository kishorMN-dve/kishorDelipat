@isTest
public class triggerOnAccountScenariofourClassTest {
   
    @testSetup
    public static void insertData(){
           Account objacc=new Account();
        objacc.Phone='123';
        objacc.Name='kishor';
        database.insert(objacc,false);
         Contact objcc=new Contact();
        objcc.Phone='456123';
        objcc.LastName='kishor';
        objcc.AccountId=objacc.id;
        database.insert(objcc,false);
       
    }
    @isTest
    public static void insertAcc(){
        Account objac=[select id,Name,Phone from Account limit 1];
       
        
        
    }

}
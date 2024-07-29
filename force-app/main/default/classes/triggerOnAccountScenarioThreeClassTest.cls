@isTest
public class triggerOnAccountScenarioThreeClassTest {
    @testSetup
    public static void insertTest(){
        Account obj=new Account();
        obj.Name='nagapure';
        database.insert(obj,false);
        Date Ddate=Date.parse('20/10/2000');
       
        Contact objcon=new Contact();
        objcon.LastName='nagapure';
        database.insert(objcon,false);
    }
    @isTest
    public static void updateMethod(){
        Account obj=[select id,Name from Account limit 1];
       
         
   Contact objex=[select id,AccountId,LastName from Contact where LastName =:obj.Name];
        if(objex.AccountId==null){
          database.delete(objex,false);  
            
        }
            
                
            
        
      
        
    }

}
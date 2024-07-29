@isTest
public class ClasspreventDupicateTriggerTestclassOne {
    @testSetup
    public static void insertMethod(){
        Account obj=new Account();
        obj.Name='kishor';
       
        database.insert(obj);
        
    }
    @isTest
    public static void insertData(){
  
      
        try{
              Account objs=new Account();
        objs.Name='kishor';
        database.insert(objs);

        }
        catch(exception e){
            system.assert(e.getMessage().contains('Duplicate Name'));
            
            
        }
    }
    @isTest
    public static void updateMethod(){
        Account objex=[select id,Name from Account limit 1];
        objex.Name='kishor';
        database.update(objex);
        
        
    }

}
@isTest
public class TriggerScenarioEightClassTest {
  @testSetup
    public static void insertlead(){
       Contact obj=new Contact();
        obj.LastName='kishor';
        obj.Email='abc@1gamil.com';
        database.insert(obj,false);
    }
    @istest
    public static void loeadData(){
         try{
              
Lead objlead=new Lead();
        objlead.Email='abc@1gamil.com';
        objlead.Company='infosys';
        objlead.LastName='nagapure';
        objlead.Status='Open - Not Contacted';
        database.insert(objlead,false);  
        }
        catch(exception e){
            system.assert(e.getMessage().contains('Duplicate Email found'));
            
            
        }
      
        
    }
     
    }
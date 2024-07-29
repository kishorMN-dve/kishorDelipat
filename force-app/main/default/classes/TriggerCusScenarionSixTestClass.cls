@isTest
public class TriggerCusScenarionSixTestClass {
    @testSetup
    public static void insertData(){
        customerobj__c objex=new customerobj__c();
        objex.Name__c='kishor';
        objex.Description__c='yes';
        database.insert(objex,false);
        
    }
    @istest
    public static void updatedata(){
        customerobj__c objeex=[select id,Name__c,Description__c from customerobj__c limit 1];
       objeex.Name__c='Ram';
        database.update(objeex,false);
    }

}
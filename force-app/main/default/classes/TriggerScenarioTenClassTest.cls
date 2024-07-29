@isTest
public class TriggerScenarioTenClassTest {
    @Testsetup
    public static void insertData(){
        customerobj__c objecs=new customerobj__c();
        objecs.Name__c='kishor';
        database.insert(objecs,false);
       list<Test_object__c>addlsit=new list<Test_object__c>();
        for(integer i=1;i<5;i++){
            Test_object__c objec=new Test_object__c();
            objec.customerobj__c=objecs.id;
            addlsit.add(objec);
        }
       database.insert(addlsit,false); 
    }
    @isTest
    public static void deletData(){
        customerobj__c objecc=[select id ,Name from customerobj__c limit 1];
        database.delete(objecc,false);
        
    }

}
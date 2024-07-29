public class TriggerScenarioTenClass {
    
    public static void executeData(list<customerobj__c>oldListCus){
       set<id>addset=new set<id>();
        for(customerobj__c objexs:oldListCus){
           addset.add(objexs.id);
         system.debug('Enter data  ==='+objexs.id);
        }
        list<Test_object__c>addlist=new list<Test_object__c>();
        if(!addset.isEmpty()){
            for(Test_object__c objex:[select id,Name__c,customerobj__c from Test_object__c where customerobj__c IN:addset]){
                
                addlist.add(objex);   
            }
            
        }
        
        database.delete(addlist,false);
    }

}
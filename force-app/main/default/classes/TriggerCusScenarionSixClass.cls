public class TriggerCusScenarionSixClass {
    public static void dataUpdate(list<customerobj__c>listcon,map<id,customerobj__c>newMapid){
        if(!listcon.isEmpty()){
            system.debug('List of data=='+listcon);
            list<Test_object__c>addlist=new list<Test_object__c>();
            for(customerobj__c objcus:listcon){
                if(objcus.Name__c!=newMapid.get(objcus.id).Name__c){
                    Test_object__c objtest=new Test_object__c();
                    objtest.Name__c=objcus.Name__c;
                    objtest.Description__c=objcus.Description__c;
                    addlist.add(objtest);
                }
                
                
            }
            system.debug('List of test  data=='+addlist);
          database.insert(addlist,false);  
            
        }
        
    }

}
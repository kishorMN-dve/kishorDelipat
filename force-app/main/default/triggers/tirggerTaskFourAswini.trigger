trigger tirggerTaskFourAswini on Work_Detail__c (after insert,after update) {
    
   public string Opration;
        if(trigger.isInsert && trigger.isAfter){
            system.debug('AFTER_INSERT '+Trigger.operationType);
            
           Opration='AFTER_INSERT' ;
            
        }
    if(trigger.isUpdate && trigger.isAfter){
         system.debug('AFTER_update '+Trigger.operationType);
        Opration='AFTER_UPDATE';
    }
    
    
    if(Opration=='AFTER_INSERT'){
        TriggerTaskFourAswiniClass.dataRecord(trigger.new,null,Opration);
        
        
    }
    if(Opration=='AFTER_UPDATE'){
          TriggerTaskFourAswiniClass.dataRecord(trigger.new,trigger.oldMap,Opration);
        
        
    }
system.debug('type'+Opration);
}
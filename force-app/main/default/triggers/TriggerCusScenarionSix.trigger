trigger TriggerCusScenarionSix on customerobj__c (before update) {
    
    if(trigger.isUpdate && trigger.isBefore){
       
        TriggerCusScenarionSixClass.dataUpdate(trigger.old,trigger.newMap);
        
    }

}
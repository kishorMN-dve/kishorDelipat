trigger TriggerScenarioTen on customerobj__c (after delete) {
    if(trigger.isDelete && trigger.isAfter){
        TriggerScenarioTenClass.executeData(trigger.old);
        
    }
}
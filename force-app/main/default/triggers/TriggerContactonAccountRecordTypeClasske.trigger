trigger TriggerContactonAccountRecordTypeClasske on Contact (before insert,before update) {
    if(trigger.isInsert && trigger.isBefore){
        TriggerContactHandlerClass.insertContact(trigger.new,null);
        
        
    }
    if(trigger.isBefore && trigger.isUpdate){
        
            TriggerContactHandlerClass.insertContact(trigger.new,trigger.oldMap);
        
        
    }

}
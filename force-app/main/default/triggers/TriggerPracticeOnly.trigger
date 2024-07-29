trigger TriggerPracticeOnly on Opportunity (after insert,after update,after undelete) {
        
       string opration;
    if(trigger.isInsert && trigger.isAfter){
       opration='AFTER_INSERT';
        system.debug('AFTER_INSERT  '+Trigger.operationType);
        TriggerPracticeOnlyClass.insertRecord(trigger.new,null,opration);
    }
    if(trigger.isAfter && trigger.isupdate){
         opration='AFTER_UPDATE';
         system.debug('AFTER_INSERT update  '+Trigger.operationType);
         TriggerPracticeOnlyClass.insertRecord(trigger.new,trigger.oldMap,opration);
    }
    if(trigger.isAfter && trigger.isUndelete){
         opration='AFTER_UNDELETE';
         system.debug('AFTER_INSERT undelete  '+Trigger.operationType);
          TriggerPracticeOnlyClass.insertRecord(trigger.new,null,opration);
    }
        }
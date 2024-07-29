trigger preventDupicateTrigger on Account (before insert,before update) {
    if(trigger.isInsert && trigger.isBefore){
        ClasspreventDupicateTrigger.handlerMethod(trigger.new);
        
        
    }
    if(trigger.isUpdate && trigger.isBefore){
          ClasspreventDupicateTrigger.handlerMethod(trigger.new);
        
        
    }

}
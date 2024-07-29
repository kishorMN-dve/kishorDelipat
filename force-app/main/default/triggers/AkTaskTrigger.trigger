trigger AkTaskTrigger on Account (after insert) {
    if(trigger.isInsert && trigger.isAfter){
        
        AkTaskTriggerClass.insertData(trigger.new);
        
        
    }
    

}
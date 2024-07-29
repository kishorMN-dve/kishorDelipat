trigger triggerNakulAccountTrack on Account (after update) {
    
    if(trigger.isAfter && trigger.isUpdate){
        
        triggerNakulAccountTrackClass.updateAccountRecord(trigger.new,trigger.oldMap);
        
    }

}
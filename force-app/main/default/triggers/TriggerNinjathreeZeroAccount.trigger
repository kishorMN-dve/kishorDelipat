trigger TriggerNinjathreeZeroAccount on Account (after update) {
    if(trigger.isUpdate && trigger.isAfter){
     
    TriggerNinjathreeZeroAccountClass.updateAccount(trigger.new,trigger.oldMap);   
        
    }
    

}
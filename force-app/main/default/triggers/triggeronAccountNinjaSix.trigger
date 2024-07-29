trigger triggeronAccountNinjaSix on Account (after update) {
    
    if(trigger.isUpdate && trigger.isAfter){
        
        triggeronAccountNinjaSix.insertDataHandler(trigger.new);
        
    }

}
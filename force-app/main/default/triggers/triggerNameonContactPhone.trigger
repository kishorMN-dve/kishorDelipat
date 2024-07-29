trigger triggerNameonContactPhone on Contact (after update) {
    
    if(trigger.isUpdate && trigger.isAfter){
        triggerNameonContactPhoneClass.updatecontact(trigger.new,trigger.oldMap);
        
        
    }

}
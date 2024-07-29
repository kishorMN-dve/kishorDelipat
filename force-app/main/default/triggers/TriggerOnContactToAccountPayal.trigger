trigger TriggerOnContactToAccountPayal on Contact (before insert) {
    if(trigger.isInsert && trigger.isBefore){
        TriggerOnContactToAccountPayal.insertDataCon(trigger.new);
        
    }
}
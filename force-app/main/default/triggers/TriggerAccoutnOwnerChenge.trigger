trigger TriggerAccoutnOwnerChenge on Account (before insert) {
    if(trigger.isInsert && trigger.isBefore){
        TriggerAccoutnOwnerChengeClass.inserRecord(trigger.new);
    }
    

}
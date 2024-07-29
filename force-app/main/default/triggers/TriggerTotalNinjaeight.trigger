trigger TriggerTotalNinjaeight on Contact (before insert) {
    if(trigger.isInsert && trigger.isbefore){
        system.debug('TriggerTotalNinjaeight ======= TriggerTotalNinjaeight');
TriggerTotalNinjaeightClass.insertHandler(trigger.new);
    }
}
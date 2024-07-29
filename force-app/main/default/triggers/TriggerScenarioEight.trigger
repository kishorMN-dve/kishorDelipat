trigger TriggerScenarioEight on Lead (before insert) {
    if(trigger.isInsert && trigger.isBefore){
        
        TriggerScenarioEightClass.insertData(trigger.new);
    }

}
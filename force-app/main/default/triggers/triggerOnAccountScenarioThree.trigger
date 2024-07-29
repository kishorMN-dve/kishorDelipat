trigger triggerOnAccountScenarioThree on Account (before   insert) {
    
    if(trigger.isBefore && trigger.isInsert){
        triggerOnAccountScenarioThreeClass.insertAccount(trigger.new);
        
    }

}
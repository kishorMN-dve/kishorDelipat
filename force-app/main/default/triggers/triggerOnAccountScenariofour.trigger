trigger triggerOnAccountScenariofour on Contact (after insert) {
    if(trigger.isInsert && trigger.isAfter){
       triggerOnAccountScenariofourClass.insertMethod(trigger.new); 
        
    }
    
    

}
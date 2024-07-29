trigger ninjaTriggerthreefour on Case (after insert) {
    if(trigger.isInsert && trigger.isAfter){
      ClassninjaTriggerthreefour.insertData(trigger.new);  
        
    }

}
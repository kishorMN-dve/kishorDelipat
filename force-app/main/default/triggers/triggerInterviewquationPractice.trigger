trigger triggerInterviewquationPractice on Contact (after insert) {
    
    if(trigger.isInsert && trigger.isafter){
triggerInterviewquationPracticeClass.className(trigger.new);        
    }

}
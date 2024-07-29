trigger TriggerOpportunityLinePandA on OpportunityLineItem (after insert) {
    
    if(trigger.isInsert && trigger.isAfter){
        
     ClassOpportunityLinePandA.insertOpp(trigger.new);
        
        
    }

}
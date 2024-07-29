trigger TriggerOpportunityNinjaTwoSix on Opportunity (after insert,after delete) {
    
    if(trigger.isInsert && trigger.isAfter){
    TriggerOpportunityNinjaTwoSixClass.insertOppdata(trigger.new);
    }
    
    if(trigger.isDelete && trigger.isAfter){
     TriggerOpportunityNinjaTwoSixClass.insertOppdata(trigger.old);  
    }
    
}
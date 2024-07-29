trigger TriggeronOpportunityPayal on Opportunity (after insert) {
    if(trigger.isInsert && trigger.isAfter){
        TriggeronOpportunityPayalClass.datainsert(trigger.new);
        
    }

}
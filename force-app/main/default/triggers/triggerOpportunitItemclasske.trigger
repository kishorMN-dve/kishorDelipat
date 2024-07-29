trigger triggerOpportunitItemclasske on OpportunityLineItem (before insert) {
    if( trigger.isInsert && trigger.isBefore){
        
        HandlerClass.insertBefore(trigger.new);
        
    }

}
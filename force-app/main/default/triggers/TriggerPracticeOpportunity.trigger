trigger TriggerPracticeOpportunity on Opportunity (after update) {
 if(trigger.isUpdate && trigger.isAfter){
           TriggerPracticeOpportunityClaass.insertRecord(trigger.new,trigger.oldMap); 
            
        }
}
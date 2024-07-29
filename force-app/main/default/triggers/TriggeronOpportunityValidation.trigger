trigger TriggeronOpportunityValidation on Opportunity (before update) {
    
    
    if(trigger.isUpdate && trigger.isBefore){
        
        map<id,Opportunity>oldOpp=new map<id,Opportunity>([select id,StageName,CloseDate,Amount from Opportunity]);
        TriggeronOpportunityValidationClass.inserOppportunity(trigger.new,oldOpp,trigger.oldMap);
        
        
        
    }

}
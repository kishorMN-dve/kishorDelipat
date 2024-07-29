trigger triggeronTaskoneAswhini on Installed_Product__c (after insert) {
    if(trigger.isAfter && trigger.isInsert){
        
        triggeronTaskoneAswhini.createrecord(trigger.new);
        
    }

}
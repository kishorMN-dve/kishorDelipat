trigger triggerNakulTaskObjBook on Book__c (after insert) {
    
    if(trigger.isInsert && trigger.isAfter){
        triggerNakulTaskObjBookClass.inserDataBook(trigger.new);
        
        
    }

}
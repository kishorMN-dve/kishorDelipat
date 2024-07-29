trigger triggerContactNinjaTen on Contact (before update , after Insert) {
    /*
    if(trigger.isBefore && trigger.isUpdate){
        
        triggerOnContactNinjaTenClass.inserHandler(trigger.new,trigger.oldMap);
      
        
    } */
    
    if(trigger.isAfter && trigger.isInsert){
        nakulConBookTask.rollUpBookAmt(trigger.new, null);
    }

}
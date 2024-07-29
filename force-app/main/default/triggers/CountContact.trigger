trigger CountContact on Contact (after insert,after delete,after undelete) {
    if(trigger.isInsert && trigger.isAfter){
    CountContactClass.insertClass(trigger.new);
    }
    if(trigger.isDelete && trigger.isAfter){
        CountContactClass.insertClass(trigger.old);
        
        
        
    }
}
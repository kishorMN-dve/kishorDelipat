trigger triggerNakul on Contact (after insert, after delete) {
    if (Trigger.isAfter) {
        String operation;
        if (Trigger.isInsert) {
            operation = 'AFTER_INSERT';
        } else if (Trigger.isDelete) {
            operation = 'AFTER_DELETE';
        }
        
        if (operation == 'AFTER_INSERT') {
            triggerNakulClass.contactdata(Trigger.new, null, operation);
        } else if (operation == 'AFTER_DELETE') {
            triggerNakulClass.contactdata(Trigger.old, Trigger.oldMap, operation);
        }
    }
}
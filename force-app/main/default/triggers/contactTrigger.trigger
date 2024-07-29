trigger contactTrigger on Contact (before insert) {
    
    
    for(Contact objacc:trigger.new){
        
system.debug('Qnter the data'+objacc.AccountId);        
        
    }

}
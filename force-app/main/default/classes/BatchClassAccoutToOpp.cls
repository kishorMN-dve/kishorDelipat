public class BatchClassAccoutToOpp implements Database.Batchable<SObject> {
    
    


    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator ('Select id,Count_of_Opportunity__c,(select id,LastModifiedDate from Opportunities where  LastModifiedDate<LAST_N_DAYS:01) from Account');
    }  
    
    public void execute(Database.BatchableContext BC,List<Account>acclist){
       
        for(Account objcon:acclist){
            list<Opportunity>accopp=objcon.Opportunities;
            system.debug('Coutn opp ######### '+accopp);
            objcon.Count_of_Opportunity__c=accopp.size();
            
        }
        
        database.update(acclist,false);
        }
    
    
    public void finish(database.BatchableContext BC){
        
        
        
    }
    
    
}
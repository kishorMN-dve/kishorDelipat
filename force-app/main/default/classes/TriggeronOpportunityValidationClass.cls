public class TriggeronOpportunityValidationClass {
    
    public static void inserOppportunity(list<Opportunity>acclist,map<id,Opportunity>mapOpp,Map<id,Opportunity>oldMap){
        
        for(Opportunity objopp:acclist){
            if(oldMap.get(objopp.id).CloseDate==objopp.CloseDate){
                objopp.AddError('Opportunity cannot have a Close Date in the past');
                
                
            }
            if(oldMap.get(objopp.id).StageName=='Prospecting' && objopp.StageName=='Closed Won'){
                
                    
                    objopp.AddError('Opportunity cannot transition directly from Prospecting to Closed Won');
                
                
            }
            
            if(objopp.StageName=='Closed Won' && objopp.Amount>=100){
                
                                    objopp.AddError('Opportunities in the “Closed Won and amount more than 100');
                
            }
            
            
        }
    }

}
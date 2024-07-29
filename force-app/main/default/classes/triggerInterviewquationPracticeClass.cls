public class triggerInterviewquationPracticeClass {
    
    public static void  className(list<Contact>conList) {
        set<id>addset=new set<id>();
        for(Contact objcon:conList){
            if(objcon.AccountId!=null){
               addset.add(objcon.AccountId); 
                
            }
            
            
        }
        if(!addset.isEmpty()){
            for(AggregateResult objAgg:[select count(id)ids, sum (Amount)amout,AccountId from Opportunity where AccountId IN:addset group by AccountId ]){
               // Integer countIds = (Integer) objAgg.get('ids');
    if ((Integer) objAgg.get('ids') == 0) {
      system.debug('Enter not have opp '+(Integer) objAgg.get('ids'));
    } else {
   
          system.debug('Enter  have opp '+(Integer) objAgg.get('ids'));

    }   
                
            }
            
            
        }
        
        
        
    }

}
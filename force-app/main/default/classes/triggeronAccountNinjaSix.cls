public class triggeronAccountNinjaSix {
    
    public static void insertDataHandler(list<Account>acclist){
       
        if(!acclist.isEmpty()){
           set<id>addset=new set<id>();
            for(Account objaccc:acclist){
                
                addset.add(objaccc.id);
            }
            
            
            if(!addset.isempty()){
              list<Opportunity>addopplist=new list<Opportunity>(); 
                for(Opportunity objopp:[select id,AccountID,StageName,CreatedDate,Name from Opportunity where AccountID IN:addset]){
                    date obj=system.today()-2;
                    if(objopp.StageName=='Closed Won' && objopp.CreatedDate<obj){
                        objopp.StageName='Closed Lost';
                       addopplist.add(objopp);
                        
                    }
                }
                database.update(addopplist,false);
            }
            
            
            
        }
        
        
        
    }

}
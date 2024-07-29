public class nakulConBookTask {
    
    
    public static void rollUpBookAmt(List<contact> newConList , Map<id,Contact> oldConMap){
        
        Set<id> setAcccId = new Set<id>();
        set<id> books = new Set<id>();
        set<Decimal>addAmount=new set<decimal>();
        Map<id,Account> mapAccount = new Map<id,Account>();
        
        try{
            if(!newConList.isEmpty()){
                for(contact con : newConList){
                    if(con.AccountId != Null && con.Book__c != Null){
                        setAcccId.add(con.AccountId);
                        system.debug('Enter contact data'+con);
                    }
                }
            }
            if(!setAcccId.isEmpty()){
                for(contact cond: [SELECT id , Book__c , Book__r.Amount_data__c, accountId FROM contact WHERE AccountId IN : setAcccId]){
                    system.debug('Enter contact itratore data'+cond);
                    
                    if(!mapAccount.containsKey(cond.AccountId)){
                        mapAccount.put(cond.AccountId , new Account(id = cond.AccountId , Count_of_Opportunity__c = cond.book__r.Amount_data__c));
                        books.add(cond.Book__c);//001
                        addAmount.add(cond.book__r.Amount_data__c);
                        
                    }
                    else{
                        if(!books.contains(cond.Book__c)){
                            if(!addAmount.contains(cond.book__r.Amount_data__c)){
                                mapAccount.put(cond.AccountId,  new Account ( id = cond.AccountId , Count_of_Opportunity__c =cond.Book__r.Amount_data__c+mapAccount.get(cond.AccountId).Count_of_Opportunity__c ) );    
                                system.debug('Add con Amount data:::' + cond.Book__r.Amount_data__c+mapAccount.get(cond.AccountId).Count_of_Opportunity__c );
                                
                            }
                            
                        }
                        
                        
                    }
                }
            }
            system.debug('inside set :::' + books);
            system.debug('mapAccount ::' + mapAccount);
            
            Database.update(mapAccount.Values(),false);
        }
        catch(exception e){
            system.debug('errrr ::' + e.getMessage() + 'line no ::::' + e.getLineNumber());
        }
        
        
    }
}
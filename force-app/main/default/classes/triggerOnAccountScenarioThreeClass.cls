public class triggerOnAccountScenarioThreeClass {
    public static void insertAccount(list<Account>acclist){
        if(!acclist.isEmpTY()){
            set<string>addset=new set<string>();
            for(Account obj:acclist){
                addset.add(obj.Name);
                
            }
            list<Contact>addlist=new list<Contact>();
            if(!addset.isEmpty()){
                for(Contact objex:[select id,AccountID,Name,LastName from Contact where LastName IN:addset]){
                    if(objex.AccountId==null){
                    addlist.add(objex);
                    }
                }
                
                
            }
            database.delete(addlist,false);
            
        }
        
        
    }

}
public class triggerOnAccountScenariofourClass {
    
    public static void insertMethod(list<Contact>listcon){
        
        map<id,Contact>putmap=new map<id,Contact>();
        for(Contact objec:listcon){
            if(objec.AccountId!=null && string.isNotEmpty(objec.Phone)){
                putmap.put(objec.AccountId,objec);
                
            } 
        }
        list<Account>addlist=new list<Account>();
        if(!putmap.isEmpty()){
            for(Account objAcc:[select id,Name,Phone from Account where id IN:putmap.keySet()]){
                objAcc.Phone=putmap.get(objAcc.id).Phone;
                addlist.add(objAcc);
                
            } 
            database.update(addlist,false);
        }
    }

}
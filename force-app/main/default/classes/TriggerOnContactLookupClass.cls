public class TriggerOnContactLookupClass {
    
    public static void insertContact(list<Account>acclist){
        map<id,Contact>putmap=new map<id,Contact>();
        if(!acclist.isEmpty()){
            for(Account objc:acclist){
              
                Contact obj=new Contact();
                obj.FirstName='jk';
                obj.LastName='maha';
                obj.AccountId=objc.id;
                
               putmap.put(obj.AccountId,obj);
                
            }   
            database.insert(putmap.values(),false);
          list<Account>addlist=new list<Account>();
            if(!putmap.isEmpty()){
                
                for(Account objex:[select id,Name,ContactId__c from Account where id IN:putmap.keySet()]){
                    objex.ContactId__c=putmap.get(objex.id).id;
                    
                    addlist.add(objex);
                }
                
                
                
                
                
            }
            database.update(addlist,false);
            
            
        }
        
        
        
        
        
    }

}
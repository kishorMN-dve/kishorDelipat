public class ClasspreventDupicateTrigger {
    
    public static void handlerMethod(list<Account>acclist){
        
       
        map<string,Account>putmap=new map<string,Account>();
        if(!acclist.isEmpty()){
            for(Account objacc:acclist){
                
                putmap.put(objacc.Name,objacc);
                 
            }
            
            if(!putmap.isEmpty()){
                for(Account objex:[select id,Name from Account where Name IN:putmap.keySet()]){
                    if(putmap.Containskey(objex.Name)){
                     putmap.get(objex.Name).addError('Duplicate Name find');
                        
                        
                        
                    }
                    
                    
                }
                
                
            
            
            
        }
    }
        
        
        
    }

}
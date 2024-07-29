public class triggerOnContactNinjaTenClass {
    
    public static void inserHandler(list<Contact>conlist,map<id,Contact>oldMap){
       map<string,Contact>putmap=new map<string,Contact>();
        map<string,Contact>putmapEmail=new map<string,Contact>();
        if(!conlist.isempty()){
            for(Contact objcon:conlist){
              if(objcon.Phone!=oldMap.get(objcon.id).Phone){
                    putmap.put(objcon.Phone,objcon);
                    
                }
                if(objcon.Email!=oldMap.get(objcon.id).Email){
                   putmapEmail.put(objcon.Email,objcon);
                    
                    
                }
                
                
            }
            if(!putmap.isEmptY()){
                for(Contact objex:[select id,Phone,Email from Contact where Email  IN:putmapEmail.KeySet()]){
                    
                   
                       
                    
                    
                }
                
                
            }
            
            
        }
    }      
            
}
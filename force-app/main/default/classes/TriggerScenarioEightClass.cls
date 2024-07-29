public class TriggerScenarioEightClass {
   
    public static void insertData(list<Lead>acclist){
        if(!acclist.isEmpty()){
            map<string,Lead>putmap=new map<string,Lead>();
            for(Lead objl:acclist){
                if(string.isNotEmpty(objl.Email)){
                   putmap.put(objl.Email,objl);
                    
                }
                
                
            }  
            if(!putmap.isEmpty()){
                for(Contact objcc:[select id,Name,Email from Contact where Email IN:putmap.keyset()]){
                    if(putmap.containskey(objcc.Email)){
                      putmap.get(objcc.Email).AddError('Duplicate Email found');  
                        
                    }
                    
                }
                
            }
        }
        
        
    }

}
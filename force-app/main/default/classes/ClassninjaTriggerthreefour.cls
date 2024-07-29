public class ClassninjaTriggerthreefour {
    
    public static void insertData(list<Case>acclist){
        if(!acclist.isempty()){
            map<id,Case>putmapcase=new map<id,Case>();
            set<id>addset=new set<id>();
            for(Case objcase:acclist){
                if(objcase.AccountId!=null &&  string.isNotBlank(objcase.Status)){
                    addset.add(objcase.AccountId);
                    putmapcase.put(objcase.id,objcase);
                    
                }
                
                
            }
            list<Task>addlisttask=new list<Task>();
            for(Task objtask :[select id,Status,WhoId,WhatID from Task where WhatID IN:putmapcase.keySet()]){
                objtask.Status=putmapcase.get(objtask.WhatId).Status;
                addlisttask.add(objtask);
            }
            map<id,Case>putcaseex=new map<id,case>();
            for(Case objex:[select id,AccountId from Case  where id IN:putmapcase.keySet()]){
                putcaseex.put(objex.AccountId,objex);
            }
            database.update(addlisttask,false);
            map<id,Account>putAcc=new map<id,Account>();
            for(Account objacc:[select id,Name,Description from Account where id IN:addset]){
                if(putcaseex.Containskey(objacc.id)){
               //     objacc
                   
                }
                
                
              
                
                
            }
            
            
            
        }
        
        
        
    }

}
public class triggerNakulAccountTrackClass {
    public static void updateAccountRecord(list<Account>acclist,map<id,Account>oldMap){
        
        try{
            list<Track_field_history_account__c>addlist=new list<Track_field_history_account__c>();
            set<id>oaddset=new set<id>();
            map<id,Account>putmap=new map<id,Account>();
            for(Account objcon:acclist){
                if(objcon.On_Hold_Reason__c!=oldMap.get(objcon.id).On_Hold_Reason__c){
                    system.debug('New values::'+objcon.On_Hold_Reason__c);
                                        system.debug('old values ::'+oldMap.get(objcon.id).On_Hold_Reason__c);

                    Track_field_history_account__c trackObk=new Track_field_history_account__c();
                    trackObk.New_Value__c=objcon.On_Hold_Reason__c;
                    trackObk.Name=oldmap.get(objcon.id).On_Hold_Reason__c;
                    trackObk.Account__c=objcon.id;                    
                    putmap.put(objcon.id,objcon);
                }
                else{
                    if(objcon.atha__c!=oldMap.get(objcon.id).atha__c){
                       oaddset.add(objcon.id);
                         putmap.put(objcon.id,objcon);
                    }
                }
   
            }
            
           database.insert(addlist,false); 
           list<Account>objlistNew=new list<Account>();
            for(Account objcon:[select id ,Name,On_Hold_Reason__c,atha__c from Account where id IN:oaddset]){
                if(objcon.On_Hold_Reason__c==null){
                    
                    objcon.On_Hold_Reason__c='GTM';
                   objlistNew.add(objcon);
                    
                }
                else{
                    if(objcon.On_Hold_Reason__c=='GTM' ||putmap.get(objcon.id).On_Hold_Reason__c=='GTM'){
                         objcon.On_Hold_Reason__c=objcon.On_Hold_Reason__c;
                     objlistNew.add(objcon);
                    }
                    else{
                        
                         objcon.On_Hold_Reason__c= objcon.On_Hold_Reason__c+';'+'GTM';
                   objlistNew.add(objcon);
                    }    
                }              }
            database.update(objlistNew,false);        }
        catch(Exception e) {
    System.debug('Error: ' + e.getMessage());
}
        
        
        
        
        
        
        
        
    }

}
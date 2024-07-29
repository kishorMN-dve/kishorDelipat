trigger TriggerOnLeadrealtedAccandcon on Lead (After insert) {
    
    if(trigger.isInsert && trigger.isAfter){
        list<Lead>addlist=new list<Lead>();
        map<id,Account>putmapacc=new map<id,Account>();
        for(Lead obj:trigger.new){
            if(obj.Status=='Working - Contacted' && obj.Rating=='Hot'){
                addlist.add(obj);
                Account objacc=new Account();
                objacc.BillingCity=obj.City;
                objacc.BillingCountry=obj.Country;
                objacc.Name=obj.Company;
                putmapacc.put(objacc.id,objacc);
            }
            
        }
        database.insert(putmapacc.values(),false);
        TriggerOnLeadrealtedAccandconClass.insertAccCon(addlist,putmapacc);
        
    }  
    
    
    
    
    
}
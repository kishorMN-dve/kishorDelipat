public class TriggerOnContactToAccountPayal {
    public static void insertDataCon(list<Contact>acclist){
       set<id>setaddCon=new set<id>();
        for(Contact obj:acclist){
            if(obj.AccountId!=null){
               setaddCon.add(obj.AccountId);
                
            }
            map<id,Account>putmapacc=new map<id,Account>();
            if(!setaddCon.isEmpty()){
               
                for(Account objacc:[select id,Name,BillingCity,CreatedDate from Account where id IN:setaddCon]){
                    putmapacc.put(objacc.id,objacc);
                    system.debug('enter the Create Date  =='+objacc.CreatedDate);
                    
                }
                
            }
            
            for(Contact objcon:acclist){
                if(putmapacc.containskey(objcon.AccountId)){
                    if(string.isNotblank(putmapacc.get(objcon.AccountId).BillingCity)){
                       // objcon.MailingCity=putmapacc.get(objcon.AccountId).BillingCity;
                        objcon.CreateDateAccount__c=putmapacc.get(objcon.AccountId).CreatedDate;
                         system.debug('con   objcon.CreateDateAccount__c =='+objcon.CreateDateAccount__c);
                    }
                  
                    
                }
                
                
            }            
        }
        
    }

}
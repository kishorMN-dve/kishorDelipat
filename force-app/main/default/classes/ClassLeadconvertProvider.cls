public with sharing class ClassLeadconvertProvider {
   @AuraEnabled
   public static id allRecord(Lead leadRecord ){
    try {
        
        system.debug('  Enter lead record  ::'+leadRecord);
        list<Account>addlist=new list<Account>();
        if(leadRecord!=null){
            Account objacc=new Account();
            objacc.Name=leadRecord.Company;
            objacc.Phone=leadRecord.Phone;
            objacc.NumberOfEmployees=leadRecord.NumberOfEmployees;
            objacc.Rating=leadRecord.Rating;
            addlist.add(objacc);
            
            
        }
      database.insert(addlist,false);
        system.debug('Enter id :'+addlist[0].id);
        list<Lead>addlistlead=new list<Lead>();
       if(leadRecord!=null){
           lead objlead =new lead();
          objlead.Account__c=addlist[0].id;
          objlead.LastName=leadRecord.LastName;
            objlead.Company=leadRecord.Company;
            
           addlistlead.add(objlead);
            
            
       }
        database.insert(addlistlead,false);
      list<Contact>addlistcon=new list<Contact>();
       if(leadRecord!=null){
           Contact obj=new Contact();
           obj.FirstName=leadRecord.FirstName;
           obj.LastName=leadRecord.LastName;
           obj.Email=leadRecord.Email;
            obj.MobilePhone=leadRecord.MobilePhone;
           obj.AccountId=addlist[0].id;
           addlistcon.add(obj);
            
            
       }
         database.insert(addlistcon,false);
         
        list<Opportunity>addopplist=new  list<Opportunity>();
        if(leadRecord!=null){
         Opportunity objOppNew =new Opportunity();
            
            objOppNew.Name=leadRecord.ProductInterest__c;
            objOppNew.StageName='Prospecting';
            objOppNew.CloseDate=system.today();
            objOppNew.AccountId=addlist[0].id;
            addopplist.add(objOppNew);
            
            
        }
     database.insert(addopplist,false);
        if(!addopplist.isEmpty()){
            return addlist[0].id;  
        }
         return null;
            
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
   }
}
public with sharing class BookProvider {
   
   @AuraEnabled
   public static list<Book__c> dataFeach(Buyer_Info__c dataType){
    try {
        Id id1 = UserInfo.getProfileId();
        String loggedUserName =[select id,Name from Profile where id =:id1].Name;
        system.debug('Enter the Profile Name '+loggedUserName);
if(dataType!=null && loggedUserName=='System Administrator'){

    database.insert(dataType,false);


    
return [select id,Price__c,Name,Book_Type__c from Book__c where Book_Type__c =:dataType.Interest__c];
}
else{

   return null;
    
}
        
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
   }


   @AuraEnabled
   public static string dataTableRowSlect(Payment__c dataRow){
    try {
        if(dataRow!=null){
        system.debug('enter data  ########################'+dataRow);
        Payment__c newOnj= new Payment__c();

        newOnj.Book__c=dataRow.Book__c;
        newOnj.Buyer_Info__c=dataRow.Buyer_Info__c;
        newOnj.Price_of_Book__c=dataRow.Price_of_Book__c;

        insert newOnj;


   
    return 'Row data select data in apex Payment  Done';
        

    }
    return 'Row data select data in apex Payment  Done123';
        
        
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
   }
}
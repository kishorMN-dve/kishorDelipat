@RestResource(urlMapping='/getAccountDetails')

global  class AccountProviderApi {

    @httpGet
    global static list<Account> getAllaccount(){
        return [select  id,Name from Account limit 5];
        
    }
}
@RestResource(urlMapping='/abcGet')
global class AccoutProviderApi{
    @httpGet
    global static list<Account>getAccountRecord(){
        return [select id,Name,Type from Account  limit 5];
        
        
    }
    @httpPost
    global static Account getPostCreateAccount(){
        RestRequest req=RestContext.Request;
        RestResponse response=RestContext.Response;
        string reciveData=req.requestBody.toString();
        Accountwarpper objWrapper=(Accountwarpper)JSON.deserialize(reciveData,Accountwarpper.class);
       
        Account objacc=new Account();
        objacc.Name=objWrapper.Name;
        objacc.Type=objWrapper.type;
        objacc.Rating=objWrapper.Rating;
        insert objacc;
        return objacc;
        
     }
    
    global class Accountwarpper{
        
        global string Name;
        global string type;
        Global string Rating;
        
        
        
    }
    
    @httpPut
    global static Account putData(){
        
        RestRequest req=RestContext.Request;
        RestResponse response=RestContext.Response;
        string reciveData=req.requestBody.toString();
        system.debug('enter the data=== '+reciveData);
        classPutwrapper objwr=(classPutwrapper)JSON.deserialize(reciveData,classPutwrapper.class);
       Account accid=[select id,Name,Type from Account where Name=:objwr.Name limit 1];
        
     accid.Type=objwr.Type;
        update accid;
       return accid;
        
        
    } 
    
    
    global class classPutwrapper{
        global string Name;
        global string Type;
         }
    
}
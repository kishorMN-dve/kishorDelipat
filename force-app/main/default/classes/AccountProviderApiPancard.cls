@restResource(urlMapping='/v1/getpancard')
global class  AccountProviderApiPancard{
global static Account phonedat(){
RestRequest request= RestContext.request;
RestResponse response=RestContext.response;

string recevivedpancrad=  request.params.get('panCeardNumbert');
 System.debug('Recived Request  '+recevivedpancrad);
    if(string.isNotBlank(recevivedpancrad)){
         return [select id,Name,Phone from Account where Phone=:recevivedpancrad  limit 1];
    }
    else{
        
        return null;
    }
    }
}
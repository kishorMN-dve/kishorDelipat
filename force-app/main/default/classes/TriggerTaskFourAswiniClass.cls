public class TriggerTaskFourAswiniClass {
    public static void dataRecord(List<Work_Detail__c> wdList, Map<Id, Work_Detail__c> oldmap, String Operation) {
        try {
            Map<Id, Work_Detail__c> putmap = new Map<Id, Work_Detail__c>();
            for (Work_Detail__c objwDetail : wdList) {
                if (Operation.equals('AFTER_INSERT')) {
                    if (String.isNotBlank(objwDetail.Line_Type__c)) {
                        putmap.put(objwDetail.Work_Order__c, objwDetail);
                    }
                }
                if (Operation.equals('AFTER_UPDATE')) {
                    if (objwDetail.Line_Type__c != oldmap.get(objwDetail.Id).Line_Type__c) {
                        putmap.put(objwDetail.Work_Order__c, objwDetail);
                    }
                }
            }

            Map<Id, List<Work_Detail__c>> addmap = new Map<Id, List<Work_Detail__c>>();
            if (!putmap.isEmpty()) {
                for (Work_Detail__c obex : [SELECT Id, Line_Status__c, Line_Type__c, Work_Order__c,Work_Order__r.Name, Work_Order__r.Summary__c, User__c,User__r.Name FROM Work_Detail__c WHERE Work_Order__c IN :putmap.keySet()]) {
                    if (obex.Line_Type__c == 'Parts') {
                        if (addmap.containsKey(obex.Work_Order__c)) {
                            addmap.get(obex.Work_Order__c).add(obex);
                        } else {
                            addmap.put(obex.Work_Order__c, new List<Work_Detail__c>{obex});
                        }
                    }
                     if (obex.Line_Type__c == 'Labor') {
                        if (addmap.containsKey(obex.Work_Order__c)) {
                            addmap.get(obex.Work_Order__c).add(obex);
                        } else {
                            addmap.put(obex.Work_Order__c, new List<Work_Detail__c>{obex});
                        }
                    }
                    
                }
            }

            List<Work_Order__c> addlists = new List<Work_Order__c>();
            for (Work_Order__c objwrd : [SELECT Id, Summary__c FROM Work_Order__c WHERE Id IN :putmap.keySet()]) {
                String summary = '';
                if (addmap.containsKey(objwrd.Id)) {
                    for (Work_Detail__c wd : addmap.get(objwrd.Id)) {
                        if(wd.Line_Type__c=='Parts' && wd.Line_Type__c!='Labor' ){
                         summary += '\nUser: ' + wd.User__r.Name + ', Work Order: ' + wd.Work_Order__r.Name;
                        }
                        else if(wd.Line_Type__c=='Labor' && wd.Line_Type__c!='Parts'){
                          summary += '\nUser: ' + wd.User__r.Name + ', Work Order: ' + wd.Work_Order__r.Name;
                            
                        }
                        else if(wd.Line_Type__c=='Labor' && wd.Line_Type__c=='Parts'){
                          summary += '\nUser: ' + wd.User__r.Name + ', Work Order: ' + wd.Work_Order__r.Name;
                            
                        }
                    }
                  
                }
               // objwrd.Summary__c = 'Parts :'+'\n'+summary + '\nLabor no data';
                if(addmap.containsKey(objwrd.Id)  && summary.contains('Parts')){
               summary += '\n Labor :'+'\n no data';
                objwrd.Summary__c ='Parts :' + summary;
                addlists.add(objwrd);
                    
            }
            
        }
            Database.update(addlists, false);
        }catch (Exception e) {
            System.debug('Error message: ' + e.getMessage());
        }
    }
}
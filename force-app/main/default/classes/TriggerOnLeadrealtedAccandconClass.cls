public class TriggerOnLeadrealtedAccandconClass {
    
    public  static  void insertAccCon(list<Lead> lec,map<id,Account>accmap){
        
        
        System.enqueueJob(new ClassTriggerOnlQueuable(lec,accmap));
        
        
        
    }
    
}
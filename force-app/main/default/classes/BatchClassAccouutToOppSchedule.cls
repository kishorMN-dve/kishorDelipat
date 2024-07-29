public class BatchClassAccouutToOppSchedule  implements schedulable {
    
    public void execute(schedulableContext BC){
        
      Database.executeBatch(new BatchClassAccoutToOpp());
    }

}
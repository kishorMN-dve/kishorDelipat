public class ClassTriggerOnlQueuable implements Queueable{
    public list<lead> accleads;
    map<id,Account>accmapobj=new map<id,Account>();
    public  ClassTriggerOnlQueuable(list<lead> aclis,map<id,Account> m){
        this.accleads=aclis;
        this.accmapobj=m;
        system.debug('Enter the Accoutn data==#####'+this.accmapobj);
        
    }
    
    public void execute(QueueableContext SC){
        list<Contact>addliscon=new list<Contact>();
        for(lead objl:accleads){
            
            if(objl.Status=='Working - Contacted' && objl.Rating=='Hot'){
                Contact obj=new contact();
                obj.AccountId=accmapobj.get(obj.AccountId).id;
                obj.FirstName=objl.FirstName;
                obj.LastName=objl.LastName;
                addliscon.add(obj);
                system.debug('enter the data AccountId =============....'+obj.AccountId);
                
            }
        }
        
        database.insert(addliscon,false);
        
    }
    
}
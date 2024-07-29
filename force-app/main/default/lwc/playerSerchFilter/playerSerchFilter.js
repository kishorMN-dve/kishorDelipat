import { LightningElement,wire,api,track} from 'lwc';
import { refreshApex } from "@salesforce/apex";

    import wireDataCricketer from '@salesforce/apex/ApexClassProvider.insertData'

    export default class PlayerSerchFilter extends LightningElement {
        @api statusValue='';
    dataParent;
    refecdata;
            cricketData;
          @track  imagevalue;
            
            @wire(wireDataCricketer,{Name:'$statusValue'})
            datawire(result){
                // this.refecdata=result;
                if(result.data){
                    
                    this.cricketData=result.data;
                    console.log(`Enter the Data PlayerSechCompo ${JSON.stringify(this.cricketData)}`);
                }
                else if(result.error){
            console.error('enter the error');
                }
            }
            
            classHandler(event){
                this.imagevalue = event.currentTarget.dataset.id;
                console.log('enter image ' + JSON.stringify(this.imagevalue));
                // console.log(`Enter the click image ${event.currentTarget.dataset.id}`);
                this.dispatchEvent(new CustomEvent('selectevent', {
                    detail: {
                        selectid: this.imagevalue
                       
                    }
                }));
            
            }
            
            }
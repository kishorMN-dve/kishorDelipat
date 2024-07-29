import { LightningElement,api,wire,track} from 'lwc';
import amazonMethod from'@salesforce/apex/AmazonClassProvider.methodName'
export default class LwcAmazonChild extends LightningElement {
 @api parentData

@track recordData
parentData2 
connectedCallback() {
    console.log('Data received from parent:',typeof(this.parentData));
    // You can further process or display the data here
}
 

 @wire(amazonMethod,{recordParent:'$parentData'})
 getRecordObject({data,error}){
if(data){
    console.log('recordData bfr'+ JSON.stringify(this.recordData));

this.recordData=data;
console.log('enter the record  name alll'+JSON.stringify(this.recordData));

}

else if(error){
alert('Getting Error');


}




 }

}
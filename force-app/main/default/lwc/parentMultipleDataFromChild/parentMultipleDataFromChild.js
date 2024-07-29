import { LightningElement } from 'lwc';

export default class ParentMultipleDataFromChild extends LightningElement {
    fName;
    lName;

    childGadaHandler(event){
console.log(`enter the chid data ${JSON.stringify(event.detail.FirstName)}`)
this.fName=event.detail.FirstName
this.lName=event.detail.LastName

    }
    
}
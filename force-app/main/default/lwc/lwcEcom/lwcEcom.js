import { LightningElement } from 'lwc';

export default class LwcEcom extends LightningElement {
   
   name;
    handlerSave(){

this.name=this.template.querySelector('lightning-input[data-formfield="accName"]').value;
console.log('Enter the data on method    ' +JSON.stringify(this.name));
    }





}
import { LightningElement,track } from 'lwc';
import callname from '@salesforce/apex/AccountProviderClass.insertDataAccount';
const COLUMNS=[
{label:'Name',fieldName:'Name',editable:true},
{label:'Id',fieldName:'Id',editable:true},
{label:'type',fieldName:'Type',editable:true}

]
//{label:'Type',fieldName:'Type',editable:true}
export default class Lwcpreatice extends LightningElement {
    @track name;
    @track date;
    @track data;
    columns=COLUMNS;
 
    changedatefield(event) {
        this.date = event.target.value;
        
        
    }

    onSaveHandler(){
        this.name=this.template.querySelector('lightning-input[data-formfield="accname"]').value;
        console.log('Enter the date field 1:',this.date);
        console.log('Enter the date field 2:',this.name);
        callname({Name:this.name,Date:this.date})
        .then(result=>{
this.data=result;
console.log('Enter the result from apex ::',result);
        })

        .catch(error=>{
console.error('Enter the error ::',error);

        })

    }

}
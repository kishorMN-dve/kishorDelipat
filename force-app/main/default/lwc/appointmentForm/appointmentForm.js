import { LightningElement, wire, track } from 'lwc';
import getRecordallapp from '@salesforce/apex/ApexProviderGetApp.getRecord';
import  inserRecordData  from '@salesforce/apex/ApexProviderGetApp.insertData';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
const COLUMNS = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Appointment Date', fieldName: 'Appointment_Date__c' },
    { label: 'End Time', fieldName: 'End_Time__c' },
    { label: 'Start Time', fieldName: 'Start_Time__c' }
]
export default class AppointmentForm extends LightningElement {
    showDataTable = true;

    @track appointment = {'SobjectType' : 'Appointment_Detail__c'};
    /// @track leadObject = { 'SobjectType': 'Lead' }
    @track dataRecord
    @track lightningInputs;
    columns = COLUMNS;
    @wire(getRecordallapp)
    wireGetRecord({ data, error }) {
        console.log('enter data from apex  ::', JSON.stringify(data));
        if (data) {
            this.dataRecord = data;
            console.log('enter data from apex  ::', JSON.stringify(data));
        }
        else if (error) {
        }
    }

    handleSelectTable(event) {
        console.log('Enter the select data record');
    }
    handleChangeValue(event) {

        console.log('event.target.label;  :', event.target.label);
        console.log('event.target.label;  :', event.target.value);
        const fieldName = event.target.label;
        if (fieldName == 'contact') {
            this.appointment.Contact__c = event.target.value;
            console.log('Enter the Name 1 ::' + JSON.stringify(this.appointment.Contact__c))
        } else if (fieldName == 'Subject') {
            this.appointment.Subject__c = event.target.value;
            console.log('Enter the Name 2 ::' + JSON.stringify(this.appointment.Subject__c))

        }
        else if (fieldName == 'Appointment Date') {
            this.appointment.Appointment_Date__c = event.target.value;
            console.log('Enter the Name 2 ::' + JSON.stringify(this.appointment.Appointment_Date__c))

        }
        else if (fieldName == 'Appointment Time') {
            this.appointment.Appointment_Time__c = event.target.value;
            console.log('Enter the Name 2 ::' + JSON.stringify(this.appointment.Appointment_Time__c))

        }
        else if (event.target.name == 'description') {
            this.appointment.Description__c = event.target.value;
            console.log('Enter the Name 2 ::' + JSON.stringify(this.appointment.Description__c))

        }



    }
    handleSubmit(event) {
        // Prevent default form submission behavior
        event.preventDefault();
        let isValid = true;
        // Perform form validation
        this.lightningInputs = this.template.querySelectorAll('lightning-input');
        console.log('Enter  all field value  input  ::', JSON.stringify(this.lightningInputs));
        this.lightningInputs.forEach(input => {
            if (!input.checkValidity()) {
                input.reportValidity();
                isValid = false;
            }
        });



        const inputs = this.template.querySelectorAll('input, textarea');
        console.log('Enter  all field value   textarea::', JSON.stringify(inputs));
        inputs.forEach(input => {
            if (!input.checkValidity()) {
                input.reportValidity();
                isValid = false;
            }
        });
        // const inputFields = this.template.querySelectorAll('lightning-input-field');
        // console.log('Enter  all field value   contacts::', JSON.stringify(inputFields));
        // inputFields.forEach(input => {
        //     // Check validity of each input field
        //     if (!input.checkValidity()) {
        //         // Report any validity errorsP

        //         input.reportValidity();
        //         // Set isValid to false if any input is invalid
        //         isValid = false;
        //     }
        // });

     //   this.template.querySelector('lightning-record-edit-form').submit(event.detail.fields);
        // If all fields are valid, submit the form
        if (isValid) {
            console.log('Enter the valida data',JSON.stringify(this.appointment));
            inserRecordData({ datainsert : this.appointment})
            .then(result=>{
                if(result==null){
                    alert('Duplicate date and time selected. Please choose a different date/time.');

                }
                else{
                    const toastEvent = new ShowToastEvent({
                        title: 'Success!',
                        message: 'Appointment created successfully.',
                        variant: 'success'
                    });
                    this.dispatchEvent(toastEvent);


                }
                

            })
            .catch(error=>{
                console.error('Enter the valida data');

            })
            
        }
    }


}
import { LightningElement ,wire} from 'lwc';
import methodName from '@salesforce/apex/ApexClassLwcShowDataUser.methodName';
import { getRecord } from 'lightning/uiRecordApi';
import Id from "@salesforce/user/Id";
const COLUMNS=[
{label:'Name',fieldName:'Name',editable:true},
{label:'Email',fieldNmae:'candidate_Email__c',editable:true},
{label:'Interest',fieldName:'Interest__c',editable:true},
{label:'Expected Price',fieldName:'Expected_Price__c',editable:true}



]

export default class LwcShowDataUserwise extends LightningElement {

columns=COLUMNS;
fullData;
fullerror;
userid=Id;

@wire(methodName,{ids:"$userid"})

abc({data,error}){
if(data){
this.fullData=data;
console.log('Enter the Data '+JSON.stringify(this.fullData));

}
else if(error){
this.fullerror=error;


}



}

}
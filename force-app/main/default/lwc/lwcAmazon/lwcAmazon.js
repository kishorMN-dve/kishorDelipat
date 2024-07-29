import { LightningElement,wire,track} from 'lwc';
    //import { getObjectInfo, getPicklistValues } from "lightning/uiObjectInfoApi";
    import {getObjectInfo,getPicklistValues} from 'lightning/uiObjectInfoApi';
    import AMAZON_OBJECT from '@salesforce/schema/Amazon__c';
    import PICKLIST_Product_Type__c from '@salesforce/schema/Amazon__c.Product_Type__c';
    export default class LwcAmazon extends LightningElement {
    @track objectRecord;
    @track picklistvalues;
    @track recordValue = '';
    @track arryDataLabelValue;
 @track value='';
 @track values;
 Name;

    @wire(getObjectInfo,{objectApiName:AMAZON_OBJECT })
    getObjectRecord({data,error}){
    if(data){
    this.objectRecord=data.defaultRecordTypeId;
    console.log(`Enter the Record ${JSON.stringify(this.objectRecord)}`);
    }
    else if(error){
    alert('Getting error');
    }
    }

    @wire(getPicklistValues,{recordTypeId:'$objectRecord',fieldApiName:PICKLIST_Product_Type__c})
    getPicklist({data,error}){
    if(data){
    let arryData=[];
    this.picklistvalues=data.values;
    this.picklistvalues.forEach(item=>{
        arryData.push({label:item.value,value:item.value});
    })
    this.arryDataLabelValue=arryData;
    console.log(`Enter the pickislist Name value ${JSON.stringify(this.picklistvalues)}`); //"template literal expression"
    console.log(`Enter the pickislist label and vslues ${JSON.stringify(this.arryDataLabelValue)}`);
    }
    else if(error){
    // alert('error not getting picklist values name');
    }
    }
    handleChangeCombobox(event){
        this.value=event.detail.value;
        this.values=event.detail.value;
    console.log('Enter the picklist valuess'+JSON.stringify(this.value));
    }
    
    handleSearchKeyword(){
       this.recordValue=this.value;
       console.log('Enter the  button ::'+JSON.stringify(this.recordValue));
    }
    connectedCallback(){
       console.log('Enter the  button in connceted callbck ::',typeof(this.recordValue));

    }
    searchKeyword(event){
this.Name=event.target.value;
console.log('enter the data'+JSON.stringify(this.Name));

    }
    }
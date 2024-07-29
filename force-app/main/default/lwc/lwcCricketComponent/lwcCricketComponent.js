import { LightningElement,wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
// import {NavigationMixin} from 'lightning/navigation'
import { getObjectInfo, getPicklistValues } from "lightning/uiObjectInfoApi";

import Cricket__c from '@salesforce/schema/Cricket__c';
import Nationality__c from '@salesforce/schema/Cricket__c.Nationality__c';

export default class LwcCricketComponent extends NavigationMixin(LightningElement) {


    // input1Value;
    // input2Value;
recordIdType;
picklistValues;
arryDataLabelValue;
value='';
nameData;
booleandata=false;
@wire(getObjectInfo,{objectApiName:Cricket__c})
recordWire({data,error}){
if(data){
    console.log('enter the Data ::'+JSON.stringify(data));
    this.recordIdType=data.defaultRecordTypeId;
    console.log('enter the Data ::'+JSON.stringify(data));

// this.recordIdType=dta
}
else if(error){
console.error('Wire error Getting ::');

}

}

@wire(getPicklistValues,{recordTypeId:'$recordIdType',fieldApiName:Nationality__c})
getPicklistWire({data,error}){
        if(data){
        let arry=[];
            this.picklistValues=data.values;
        this.picklistValues.forEach(element=>{
            arry.push({label:element.value,value:element.value});
        })
        this.arryDataLabelValue=arry;
    console.log('Enter the Data picklist::'+JSON.stringify(arry));
        }
        else if(error){
    console.error('Enter the  Error');

        }






}
    handleClick(event){

        // =====> pass data html to js using event strt <===========
     
// const fieldName = event.target.label;
// console.log('Enter the Name  ::'+JSON.stringify(fieldName));
// if (fieldName =='Input 1') {
//     this.input1Value = event.target.value;
//     console.log('Enter the Name 1 ::'+JSON.stringify(this.input1Value))
// } else if (fieldName =='Input 2') {
//     this.input2Value = event.target.value;
//     console.log('Enter the Name 2 ::'+JSON.stringify(this.input2Value))

// }
}
  //======> pass data html to js using event stop  <================
handleInputChange() {
    console.log('Enter click button :: ');
    // console.log('Input 2 Value:', this.input2Value);
    // Perform further actions with input1Value and input2Value

    // navigation cricket new button
    this[NavigationMixin.Navigate]({
        type: 'standard__objectPage',
        attributes: {
            objectApiName: 'Cricket__c',
            actionName: 'new'
        }
    });
                            //  END
    
}

handleChangeCombobox(event){
    this.value=event.detail.value;
    
       
 
    



}

handlerChild(event){
    this.nameData=event.detail.selectid;
    this.booleandata=true;
console.log(`child the data ${event.detail.selectid}`);

}
    }
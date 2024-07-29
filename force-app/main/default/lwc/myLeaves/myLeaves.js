import { LightningElement,wire,api} from 'lwc';
import leaveMethodS from '@salesforce/apex/LeaveRequestController.leaveMethodS'
  const COLUMNS=[
    
    { label: 'ID',fieldName: 'Id',cellAttributes:{class:{fieldName:'cellClass'}}},
    { label: 'NAME',fieldName: 'Name_Of_Employee__c',cellAttributes:{class:{fieldName:'cellClass'}}},
    { label: 'TO DATE',fieldName:'From_Date__c',cellAttributes:{class:{fieldName:'cellClass'}}},
    { label: 'FROM DATE',fieldName:'To_Date__c',cellAttributes:{class:{fieldName:'cellClass'}}},
    { label: 'LEAVE TYPE',fieldName:'Leave_Type__c',cellAttributes:{class:{fieldName:'cellClass'}}},
    { label: 'Satus',fieldName:'satus__c',cellAttributes:{class:{fieldName:'cellClass'}}},
    { label: 'RESONE', fieldName:'Leave_Description__c',cellAttributes:{class:{fieldName:'cellClass'}}},
{type:'button',typeAttributes:{
name:'Edit',
type:'Edit',
value:'Edit',
label:'Edit',
disabled:{fieldName:'isEditable'}
}}


 ];

export default class MyLeaves extends LightningElement {
columns=COLUMNS;
datas;
@api recordId;
error;
objectApiName='Leave_Managment__c';
showPopPoup=false;
datass=[];
    @wire(leaveMethodS)
    dataFetch({data,error}){
    if(data){

    this.datas=data;
    this.datass=data.map(iteam=>({
        ...iteam,cellClass:iteam.satus__c =='approve'? 'slds-theme_success':iteam.satus__c=='reject'?'slds-theme_warning':'',isEditable:iteam.satus__c!='pending'

    }));
    // console.log('Enter the apex data MY leave== '+JSON.stringify(data))
    }
    else if(error){

    console.error('Enter the error data');


    }



    }


get recordReturnNorecord(){

return this.data==0;


}

onPopupColse(){

this.showPopPoup=false;



}
onSuccessHandler(){


}
onselectHandlerAdded(){
    this.showPopPoup=true;

}

}
import { LightningElement,wire,track,api } from 'lwc';
import accountWire from '@salesforce/apex/googleMapAccountProvider.methodName';

export default class GoogleMapLwc extends LightningElement {
@track markerData=[]; 
@track error;
@api accountNamePram='Aitechone';
@wire(accountWire,{accName:'$accountNamePram'})
wireAccountData({data,error}){
if(data){
    data.forEach(dataIteam=>{
this.markerData=[...this.markerData,
    {
location:{
    City:dataIteam.BillingCity,
    Country:dataIteam.BillingCity,
},
icon:'custome:custom26',
title:dataIteam.Name,



}];

    });
    this.error=undefined;

}
else if(error){
this.error=error;

}

}



}
import { LightningElement, api, track, wire } from 'lwc';
import getObjectFieldset from '@salesforce/apex/CreateNewRecordController.sendSchemaData';
export default class CreatingNewRecord extends LightningElement {
    @api objectApiName = 'Account';

    connectedCallback() {
        getObjectFieldset({objectApiName: this.objectApiName})
        .then(data=>{
            console.log(JSON.stringify(data));
        })
        .catch(error=>{
            console.log(JSON.stringify(error));
        })
    }
}
import { LightningElement } from 'lwc';
import getAccountRecord from '@salesforce/apex/getAccountRecord.getAccount'
import setAccountRecord from '@salesforce/apex/getAccountRecord.setAccount'
const columns = [
    { label: 'ID', fieldName: 'Id', editable: false },
    { label: 'Name', fieldName: 'Name', editable: true }
];
export default class SearchAccount extends LightningElement {

    columns = columns;
    searchName;
    account;
    saveDraftValues;

    handleInput(event){
        this.searchName = event.target.value;
    }

    handleGetRecord(){
        getAccountRecord({searchName: this.searchName})
        .then((result) => {
                this.account = result;
                console.log(result);
            })
            .catch(error => {
                this.error = error;
            });

            console.log(this.account);
    }

    handleSave(event) {
    this.saveDraftValues = event.detail.draftValues;
    console.log(this.saveDraftValues);


     setAccountRecord({accList:  this.saveDraftValues})
}
}
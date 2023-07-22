import { LightningElement, api, track } from 'lwc';
import updateData from '@salesforce/apex/AccountRelatedDataController.updateData';
import deleteData from '@salesforce/apex/AccountRelatedDataController.deleteData';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';


export default class ShowDataInDataTable extends NavigationMixin(LightningElement) {


    allRecords;
    _records;
    @api heading;
    recordForAction;
    recordForActionArray;
    error;
    fieldsetvalues = [];
    fieldset;
    dataToShowOnTemplate = [];
    @api objectApiName = '';

    @api
    get records() {
        console.log('_records-->', this._records);
        return this._records;
    }
    set records(value) {
        if (typeof value == 'string') {
            console.log('Value-->', value);
            console.log(this._records);
            this._records = value;
        } else {
            console.log('Value-->', value);
            console.log(this._records);
            this._records = '';

        }
        console.log('Value-->', value);
        console.log(this._records);
        this.setDataToTable();
    }

    connectedCallback() {
        console.log('connected call back',this.objectApiName);
    }

    setDataToTable() {
        this.dataToShowOnTemplate = [];
        if (this._records != '') {
            console.log(this._records);
            this.allRecords = JSON.parse(this._records);
            this.fieldset = Object.keys(this.allRecords[0]);
            console.log(Object.keys(this.allRecords[0]));
            //console.log(this.data);

            this.allRecords.forEach(rec => {
                let particularRec = Object.values(rec);
                this.dataToShowOnTemplate.push(particularRec);
            });
            console.log(this.dataToShowOnTemplate);
        }

    }
    @api getRecord(records) {
        console.log(records);
        //this._records = records;
    }

    fieldConfig() {
        this.fieldsetvalues = [];
        for (let i = 0; i < this.fieldset.length; i++) {
            this.fieldsetvalues.push({ "field": this.fieldset[i], "value": this.recordForActionArray[i] });
        }
        this.fieldsetvalues = [...this.fieldsetvalues];
        console.log(this.fieldsetvalues);
    }

    callRowAction(event) {

        // const recId = event.target.title;
        this.recordForActionArray = event.target.name;
        const recId = event.target.name[0];
        console.log(recId);
        //console.log(actionName);
        if (event.target.title == 'Edit') {
            this.allRecords.forEach(rec => {
                if (rec.Id == recId)
                    this.recordForAction = rec;
            });
            console.log(this.recordForAction);
            this.fieldConfig();
            console.log(this.template.querySelector('c-edit-modal'));
            this.template.querySelector('c-edit-modal').showModal(true);

        }
        else if (event.target.title == 'Delete') {
            this.allRecords.forEach(rec => {
                //const recId = rec;
                if (rec.Id == recId)
                    this.recordForAction = rec;
            });
            console.log(this.recordForAction);
            this.deleteRecord();
        }

    }

    changeHandle(event) {
        this.recordForAction[event.target.label] = event.target.value;
        console.log(this.recordForAction);
    }

    updateRecord() {
        console.log(this.recordForAction);
        updateData({ "dataToUpdate": this.recordForAction })
            .then(result => {
                this.modalclose();
                this.handleToastEvent('Success', 'Record Updated SuccessFully', 'success');
                this.dispatchEvent(new CustomEvent('refresh'));
            })
            .catch(error => {

            });
    }
    deleteRecord() {
        console.log(this.recordForAction);
        deleteData({ "dataTodelete": this.recordForAction })
            .then(result => {

            })
            .catch(error => {

            });
    }

    modalclose() {
        console.log('in modal close');
        this.template.querySelector('c-edit-modal').closeModal();
    }

    handleToastEvent(title, message, variant) {
        const evt = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
            mode: 'pester'
        });
        this.dispatchEvent(evt);
    }

}
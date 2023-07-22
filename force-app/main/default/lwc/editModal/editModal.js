import { LightningElement, api, track } from 'lwc';
//import closeLabel from '@salesforce/label/c.CMT_Close';


export default class CmtModal extends LightningElement {
    // $Label = {
    //     close: closeLabel
    // }
    @api modalHeader = '';
    @api showHeader = false;
    @api showFooter = false;

    @track displayModal = false;

    @api hideModal() {
        this.displayModal = false;
    }

    @api showModal(event) {
        this.displayModal = event;
    }

    @api closeModal() {
        this.hideModal();
        //this.dispatchEvent(new CustomEvent('modalclose'));
    }

    get headerStyleClass() {
        return `slds-modal__header ${this.showHeader ? `` : `slds-modal__header_empty`}`;
    }

    get modalStyleClass() {
        //TODO add support for modal sizes
        return `slds-modal slds-fade-in-open`;
    }
}
import { LightningElement, api, track } from 'lwc';


export default class CmtModal extends LightningElement {
    $Label = {
        close: 'Close'
    }

    @api showHeader = false;
    @api showFooter = false;
    @api heading = '';

    @track displayModal = false;

    @api hideModal(){
        this.displayModal = false;
    }

    @api showModal(){
        this.displayModal = true;
    }

    closeModal(){
        this.hideModal();
        this.dispatchEvent(new CustomEvent('modalclose'));
    }

    get headerStyleClass(){
        return  `slds-modal__header ${this.showHeader ? `` : `slds-modal__header_empty`}`;
    }

    get modalStyleClass(){
        //TODO add support for modal sizes
        return `slds-modal slds-fade-in-open`;
    }

    contentStyle = 'slds-modal__content';

    @api
    get modalContentStyle(){
        console.log('this contentStyle--->',this.contentStyle);
       return this.contentStyle
    }
    set modalContentStyle(value){
        console.log('value-->',value);
        if(value){
            this.contentStyle = 'slds-modal__content content';
        }
        else{
            this.contentStyle = 'slds-modal__content';
        }
    }
}
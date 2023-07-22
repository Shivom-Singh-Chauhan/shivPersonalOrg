import { LightningElement } from 'lwc';
export default class ForModalTest extends LightningElement {
    handleClick(){
    this.template.querySelector('c-modal').showModal();
    }
}
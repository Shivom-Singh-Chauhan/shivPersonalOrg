import { LightningElement, api } from 'lwc';

export default class ChildComp extends LightningElement {
  @api accountName
  handleClick(){
    this.accountName = this.template.querySelector('lightning-input').value;
    console.log('account name'+this.accountName);
    const event = new CustomEvent("sendaccount", {
      detail : this.accountName
    });

    this.dispatchEvent(event);
  }
}
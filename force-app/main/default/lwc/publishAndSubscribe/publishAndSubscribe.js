import {api, wire, LightningElement } from 'lwc';

import { publish, subscribe, MessageContext } from 'lightning/messageService';
import ChannelFroAuraLWC from '@salesforce/messageChannel/channelForAuraLWC__c';

export default class PublishAndSubscribe extends LightningElement {
    subscription = null;

    @wire(MessageContext)
    messageContext;

    fullname;

    valueTobeEdit = 'Edit it from Aura';


    connectedCallback() {
        this.subscribeToMessageChannel();
    }

    handleClick(event) {
        var name = this.template.querySelector('lightning-input').value;
        console.log("name",name);
        const payload = { Message:  name};

        publish(this.messageContext, ChannelFroAuraLWC, payload);
    }

    handleMessage(message) {
        //this.fullname = message.Message;
        console.log(message.Message);
        if(message.Message == "Edit"){
            this.editFunction();
        }
    }

     subscribeToMessageChannel() {
        // this.subscription = subscribe(
        //     this.messageContext,
        //     ChannelFroAuraLWC,
        //     (message) => this.handleMessage(message)
        // );
    }

    @api editFunction(){
       // console.log("value"+value);
        this.valueTobeEdit = "Some Random Value";
    }


}
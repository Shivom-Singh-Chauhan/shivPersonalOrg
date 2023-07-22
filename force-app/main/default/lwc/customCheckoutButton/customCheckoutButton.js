import { LightningElement } from 'lwc';
import checkout from '@salesforce/apex/CustomCheckoutButtonController.productCheckout';

export default class CustomCheckoutButton extends LightningElement {
    
    handleCheckout(){

        checkout({ cartId : '0a65i000000Cu6YAAS' })
		.then(result => {
			
		})
		.catch(error => {
			
		})
    }
}
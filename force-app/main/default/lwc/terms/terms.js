import { LightningElement, api } from 'lwc';
 
/**
 * Terms and Conditions has a link to the terms and conditions for the 
 * checkout user to read and a checkbox to accept the terms. Place order 
 * should be blocked by this component when placed in the payment step 
 * before or after the payment component.
 * 
 * One page layout: this component may be placed in its own section 
 * before or after payment.
 *
 * Accordion layout: this component may be placed in its own section 
 * before the payment section.
 * 
 * Accordion layout: this component may be placed directly in the 
 * payment section before or after the payment component.
 */
export default class Terms extends LightningElement {
   _checkedByDefault;  
   checked;
   showError = false;
 
   /**
    * The terms may be checked by default from the builder property panel.
    */
    @api
    get checkedByDefault() {
        return this._checkedByDefault;
    }
 
    set checkedByDefault(value) {
        this._checkedByDefault = value;
        this.checked = value;
    }
 
    /**
     * Embed a link directing in the disclaimer string.
     */
    get disclaimerLink() {
       if (this.disclaimer.indexOf('[[') > 0 
         && this.disclaimer.indexOf('[[') 
         << this.disclaimer.indexOf(']]')) {
           return this.disclaimer
             .replace('[[', `<a href="${this.link}" 
                            target="termsandconditions">`)
             .replace(']]', '</a>');
        } else {
           return `<a href="${this.link}" 
            target="termsandconditions">${this.disclaimer}</a>`;
        }
    }
 
    // The message to show to the shopper
    @api
    disclaimer;
 
    // The link to the page containing the terms and conditions
    @api
    link;
 
    // The error message instructing the user to accept the terms
    @api
    error;
 
    /**
     * Required by checkout to register as a checkout component
     * 1 = EDIT mode
     */
     @api
    checkoutMode = 1;
 
    /**
     * Report false and show the error message until the user accepts the Terms
     */
    @api
    get checkValidity() {
        this.showError = !this.checked;
        return this.checked;
    }
  
    /**
     * Report false and show the error message until the shopper accepts the 
     * Terms Checkout has reportValidity functionality.
     * 
     * One-page Layout: reportValidity is triggered clicking place order.
     * 
     * Accordion Layout: reportValidity is triggered clicking each section's 
     * proceed button.
     *
     * @returns boolean
     */
    @api
    reportValidity() {
        this.showError = !this.checked;
 
        return this.checked;
    }
 
   /**
    * Works in Accordion when terms component before payment component.
    * 
    * Works in One Page when terms component placed anywhere.
    * 
    * Can be in same step/section as payment component as long as it is placed 
    * before payment info.
    *
    * (In this case this method is redundant and optional but shows as an 
    * example of how checkoutSave can also throw an error to temporarily halt 
    * checkout on the ui)
    */
    @api
    checkoutSave() {
      if (!this.checkValidity) {
        throw new 
          Error(
          'Terms and Conditions must be accepted first by clicking the checkbox');
        }
    }
 
    /**
     * The method is called in one-page layout only when the place order button 
     * is clicked. Used in conjunction with the payment component/section for 
     * checkout one-page layout.
     *
     * Must be placed before the payment component in the same payment section 
     * or any prior section.
     *
     * @type Promise<void>
     */
     @api
    placeOrder() {
        return this.reportValidity();
    }
 
    /**
     * Check and uncheck the checkbox. Show error unless checked.
     * @param {*} event
     */
    handleChange(event) {
        this.checked = event.target.checked;
        this.showError = !this.checked;
    }
}
import { LightningElement } from 'lwc';
import bootstrap from '@salesforce/resourceUrl/Bootstarp';
import { loadStyle, loadScript } from 'lightning/platformResourceLoader';

export default class CommerceIndexPage extends LightningElement {

    renderedCallback() {
        Promise.all([
            //loadStyle(this, bootstrap + '/leaflet.css'),
            loadScript(this, bootstrap),
        ]).then(() => {
            console.log("All scripts and CSS are loaded. perform any initialization function.");
        })
        .catch(error => {
            console.log("failed to load the scripts");
        });
    }
}
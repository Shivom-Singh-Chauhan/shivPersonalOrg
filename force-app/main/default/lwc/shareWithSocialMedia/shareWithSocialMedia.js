import { LightningElement } from 'lwc';

export default class ShareWithSocialMedia extends LightningElement {
handleClick(){
    let url = window.location.href;
    let whatappurl = "https://api.whatsapp.com/send?phone=&text=<>" +url;
        this.shareUrl = whatappurl;
        console.log("this.shareUrl--"+this.shareUrl);
        
        // window.location.replace(this.shareUrl, '_blank');
        window.open(this.shareUrl, "_blank")
}

}
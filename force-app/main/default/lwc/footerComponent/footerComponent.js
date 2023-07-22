import { LightningElement ,api, track} from 'lwc';

export default class FooterComponent extends LightningElement {

trailheadLogoUrl = TRAILHEAD_LOGO;
@api showFooterImage;
get backgroundStyle() {
    return `background-image:url(${this.trailheadLogoUrl});background-position: bottom;background-repeat: no-repeat;`;
  }
   renderedCallback() {
    //    console.log('Show Image =====>>>'+this.showFooterImage);
        Promise.all([
           
            loadStyle(this, 'https://fonts.googleapis.com/css?family=Raleway'),
        ])
            .then(() => {
                
                // console.log('Css Files loaded.');
            })
            .catch(error => {
                alert(error.body.message);
            });
    }

// renderedCallback() {
//     this.template.querySelector(".maindiv").style.backgroundImage=URL(`${TRAILHEAD_LOGO}`);
    
    

// }

}
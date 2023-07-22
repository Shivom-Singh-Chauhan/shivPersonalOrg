import { LightningElement,api,track } from 'lwc';

const cbClass = 'slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click';
export default class MultiLookup extends LightningElement {

    label = {
        "SelectedOption" : "Selected Option",
        "RemoveSelectedOptions":"Remove Selected Option",
        "NoResultFound":"No Result Found",
        "Remove":"Remove"
      }

    @api placeHolder ;
    @api readOnly;
    @api selectedOptions=[];
    @track optionsToDisplay = [];    
    @api showSelectedOptions = false;
    @track cbComputedClass = cbClass;
    @track isComboExpanded = false;
    @track searchKey;
    @track noResultsFound = false;
    _options = [];
    selOptionsMap = new Map();

    @api
    get options(){
        return this._options;
    }

    set options(value){
        let i=0;
        value.forEach((opt) => {
            const obj = {...opt};
            obj.index = i++;
            obj.hasIcon = obj.icon ? true : false;
            this.optionsToDisplay.push(obj);
            this._options.push(obj);
        });
    }
}
import { LightningElement, track, api } from 'lwc';
import getData from '@salesforce/apex/AccountRelatedDataController.sendData';
export default class AccountRelatedData extends LightningElement {

    accountList;
    @track contactList;
    showContact = false;
    showOpportunity = false;
    @track opportunityList;
    allContactList;
    allopportunityList;
    accountOptions = [];
    contactNamesForChart;
    contactRevenueForChart;
    opportunityNamesForChart;
    opportunityRevenueForChart;
    accountNamesForChart;
    grossRevenueForChart;
    @track showData = false;
    values;
    showChart = false;

    connectedCallback() {
        getData()
            .then(result => {
                this.accountList = result.accList;
                
                this.allContactList = result.contactList;
                
                this.allopportunityList = result.opportunityList;
                for(let accId in this.accountList){
                     let accOpt = { label: this.accountList[accId].Name, value: accId };
                     this.accountOptions.push(accOpt);
                }
                this.accountOptions = [...this.accountOptions];
                 console.log('accountOptions>>>>>'+JSON.stringify(this.accountOptions));
                 console.log('accountList>>>>>'+JSON.stringify(this.accountList));
                 console.log('allContactList>>>>>'+JSON.stringify(this.allContactList));
                 console.log('allopportunityList>>>>>'+JSON.stringify(this.allopportunityList));
            })
            .catch((error) => {
                console.log('In connected call back error-->', error);
            });
    }

    selectAccountHandle(event) {
        
        this.showData = false;
        this.contactList = [];
        this.opportunityList = [];
        this.values = event.detail.value;
        console.log(this.allopportunityList);

        this.allContactList.forEach(con => {
            if(con.AccountId == this.values)
                this.contactList.push(con);
        });
        this.allopportunityList.forEach(opp => {
            if(opp.AccountId == this.values)
                this.opportunityList.push(opp);
        });
            console.log('Check Line');
        if (this.contactList.length != 0) {
            //this.contactList = [];
            //this.contactList = this.contactMap[this.values];
            let allConName = [];
            let allConValues = []
            this.contactList.forEach(con => {
                allConName.push(con.Name);
                allConValues.push(con.Current_rvenue_generated__c);
            });
            this.contactNamesForChart = JSON.stringify(allConName);
            this.contactRevenueForChart = JSON.stringify(allConValues);
            this.contactList = JSON.stringify(this.contactList);

            if(this.contactList.length != 0)
                this.showContact = true;
        }

        console.log(this.contactList);
        if (this.opportunityList.length != 0) {
            //this.opportunityList = [];
            //this.opportunityList = this.opportunityMap[this.values];
            let allOppName = [];
            let allOppValues = []
            this.opportunityList.forEach(opp => {
                allOppName.push(opp.Name);
                allOppValues.push(opp.Current_revenue_generated__c);
            });
            this.opportunityNamesForChart = JSON.stringify(allOppName);
            this.opportunityRevenueForChart = JSON.stringify(allOppValues);
            this.opportunityList = JSON.stringify(this.opportunityList);

            if(this.opportunityList.length != 0)
                this.showOpportunity = true;
        }
        console.log(this.opportunityList);

        this.accountNamesForChart = JSON.stringify(['Contact', 'Opportunity']);
        this.grossRevenueForChart = JSON.stringify([this.accountList[this.values].Revenue_genrated_from_contact__c, this.accountList[this.values].Revenue_generated_from_opportunity__c]);

        this.showData = true;

        // if(this.contactList){
        //     console.log(this.template.querySelector('c-show-data-in-data-table'));
        //     this.template.querySelector('c-show-data-in-data-table').connectedCallback();
        // }
    }

    handleShowChart(event) {
        console.log(event.target.label);
        if(event.target.label == 'Show Chart View')
            this.showChart = true;
        if(event.target.label == 'Show Table View')
            this.showChart = false;
    }

    refreshData(){
        console.log('in refresh data')
        //this.connectedCallback();
    }
}
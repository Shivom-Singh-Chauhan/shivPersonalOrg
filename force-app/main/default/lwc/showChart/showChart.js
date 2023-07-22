import { LightningElement, track, api } from 'lwc';
import chartjs from '@salesforce/resourceUrl/ChartJs';
import { loadScript } from 'lightning/platformResourceLoader';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class ShowChart extends LightningElement {
    @track isChartJsInitialized;
    @api heading;
    @api subHeading;
    @api footerDecription;
    chart;
    @api recordLabels = [];
    @api recordData = [];
    backgroundColorSet = [
        'rgb(255, 99, 132)',
        'rgb(54, 162, 235)',
        'rgb(255, 205, 86)',
        'rgb(25, 99, 132)',
        'rgb(54, 16, 235)',
        'rgb(255, 20, 86)',
        'rgb(255, 99, 13)',
        'rgb(540, 162, 235)',
        'rgb(25, 205, 86)',
        'rgb(255, 109, 132)',
        'rgb(130, 160, 235)',
        'rgb(100, 205, 86)',
        'rgb(255, 99, 32)',
        'rgb(54, 16, 35)',
        'rgb(255, 50, 236)'
    ]

    config;

    connectedCallback() {
        console.log(this.subHeading);
        
        this.recordData = JSON.parse(this.recordData);
        this.recordLabels = JSON.parse(this.recordLabels);
        console.log(this.recordData);
        console.log(this.recordLabels);

        this.config = {
        type: 'doughnut',
        data: {
            labels: this.recordLabels,
            datasets: [{
                label: 'Revenue For Account',
                data: this.recordData,
                backgroundColor: this.backgroundColorSet,

                hoverOffset: 4
            }]
        },
        options: {
            title: {
                display: true,
                text: this.subHeading
            }
        }
    };
    }

    renderedCallback() {
        if (this.isChartJsInitialized) {
            return;
        }
        this.isChartJsInitialized = true;

        Promise.all([
            loadScript(this, chartjs)
        ]).then(() => {
            const ctx = this.template.querySelector('canvas.doughnut').getContext('2d');
            this.chart = new window.Chart(ctx, this.config);
            this.chart.canvas.parentNode.style.height = '100%';
            this.chart.canvas.parentNode.style.width = '100%';
        }).catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error loading ChartJS',
                    message: error.message,
                    variant: 'error',
                }),
            );
        });
    }
}
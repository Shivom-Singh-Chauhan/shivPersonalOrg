import { LightningElement, wire } from 'lwc';


export default class ParentComp extends LightningElement {

  totalInput;
  input1;
  input2;
  result;
  arr = [];
  value = [];

  getNumChange(event){
    this.arr = [];
    this.totalInput = parseInt(event.target.value);
    console.log( this.totalInput);

    for( let n = 0 ; n < this.totalInput -2 ; n++){
       this.arr[n] = n;
    }
    console.log(this.arr);
  }

  FirstChange(event){
    this.input1 = parseInt(event.target.value);
    console.log(this.input1);
  }

  SecondChange(event){
    //this.input2 = this.template.querySelector('lightning-input').value;
    this.input2 = parseInt(event.target.value);
    console.log(this.input2);
  }
  
  getChange(event){
    console.log(event.target.value);
    // for(let i = 0 ; i < this.totalInput -2 ; i++)
    // {   if(event.target.key == i){
    //         this.value.push(parseInt(event.target.value));
    // } 
    // }
    console.log(event.target.key);
  }

  handleSum(){
    
    let sum = 0;
    for (let i = 0; i < this.value.length; i++) {
        sum = sum + this.value[i];
    }
    console.log(sum);
    this.result = this.input1 + this.input2 + sum;
    console.log(this.result);
  }

  handleSubtract(){

    let sum = 0;
    for (let i = 0; i < this.value.length; i++) {
        sum = sum + this.value[i];
    }

    this.result = this.input1 - (this.input2 + sum);
    console.log(this.result);
  }

  handleMultiply(){

    let sum = 1;
    for (let i = 0; i < this.value.length; i++) {
        sum = sum * this.value[i];
    }

    this.result = this.input1 * this.input2 * sum;
    console.log(this.result);
  }

  handleDivide(){
    this.result = this.input1 / this.input2;
    console.log(this.result);
  }

}
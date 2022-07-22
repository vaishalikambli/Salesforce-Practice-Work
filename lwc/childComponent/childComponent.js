import { LightningElement, api } from 'lwc';

export default class ChildComponent extends LightningElement {
  @api studentDetail; //@api decorator to make the children properties/method public available so a parent can be able to call it directly using JavaScript API. 

  get showStudent(){
    if(this.studentDetail){
      return this.studentDetail.Age > 25;
    }
    return false;
  }

  get showStudentAge(){
    if(this.studentDetail){
      return this.studentDetail.Age;
    }
    return '';
  }
}
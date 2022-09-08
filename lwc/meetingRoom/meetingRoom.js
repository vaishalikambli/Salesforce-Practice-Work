import { api, LightningElement } from 'lwc';

export default class MeetingRoom extends LightningElement {
  @api meetingRoomInfo = {roomName: 'A-01', roomCapacity:'12'}
  @api showRoomInfo = false;

  //Child component passing meeting room info to parent component meeting rooms
  tileClickHandler() {
    const tileClicked = new CustomEvent('titleClick', {detail : this.meetingRoomInfo, bubbles:true});

    this.dispatchEvent(tileClicked);
  }
}
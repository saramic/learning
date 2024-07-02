import { Component } from '@angular/core';

@Component({
  selector: 'app-seven-segment',
  standalone: true,
  imports: [],
  templateUrl: './seven-segment.component.html',
})
export class SevenSegmentComponent {
  onColor = "#FF0000";
  offColor = "#F5E1E1";
  colorA = this.offColor;
  colorB = this.offColor;
  colorC = this.offColor;
  colorD = this.offColor;
  colorE = this.offColor;
  colorF = this.offColor;
  colorG = this.offColor;

  ngOnInit() {
    console.log('SevenSegmentComponent initialized');
  }
}

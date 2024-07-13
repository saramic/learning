import { Component, Input, SimpleChange, SimpleChanges } from '@angular/core';

@Component({
  selector: 'app-seven-segment',
  standalone: true,
  imports: [],
  templateUrl: './seven-segment.component.html',
})
export class SevenSegmentComponent {
  @Input() bitState: string = "fc";

  onColor = '#FF0000';
  offColor = '#F5E1E1';
  colorA = this.offColor;
  colorB = this.offColor;
  colorC = this.offColor;
  colorD = this.offColor;
  colorE = this.offColor;
  colorF = this.offColor;
  colorG = this.offColor;

  constructor() { }

  ngOnChanges(changes: SimpleChanges) {
    // console.log("Changes detected");
    // console.log(changes['bitState'].currentValue)
    this.bitState = changes['bitState'].currentValue;
    this.setSegments(this.bitState);
  }

  setSegments(bitState: string) {
    const segmentColors = parseInt(bitState, 16)
      .toString(2)
      .padStart(8, '0')
      .split('')
      .map((bit) => (bit === '1' ? this.onColor : this.offColor));
    this.colorA = segmentColors[0];
    this.colorB = segmentColors[1];
    this.colorC = segmentColors[2];
    this.colorD = segmentColors[3];
    this.colorE = segmentColors[4];
    this.colorF = segmentColors[5];
    this.colorG = segmentColors[6];
  }
}

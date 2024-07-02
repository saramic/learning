import { Component } from '@angular/core';
import { timer } from 'rxjs';

@Component({
  selector: 'app-seven-segment',
  standalone: true,
  imports: [],
  templateUrl: './seven-segment.component.html',
})
export class SevenSegmentComponent {
  onColor = '#FF0000';
  offColor = '#F5E1E1';
  colorA = this.offColor;
  colorB = this.offColor;
  colorC = this.offColor;
  colorD = this.offColor;
  colorE = this.offColor;
  colorF = this.offColor;
  colorG = this.offColor;
  current = 0;

  source = timer(0, 300);

  ngOnInit() {
    this.source.subscribe(() => this.next());
  }

  next() {
    this.current = (this.current + 1) % 10;
    switch (this.current) {
      case 0:
        this.colorA = this.onColor;
        this.colorB = this.onColor;
        this.colorC = this.onColor;
        this.colorD = this.onColor;
        this.colorE = this.onColor;
        this.colorF = this.onColor;
        this.colorG = this.offColor;
        break;
      case 1:
        this.colorA = this.offColor;
        this.colorB = this.onColor;
        this.colorC = this.onColor;
        this.colorD = this.offColor;
        this.colorE = this.offColor;
        this.colorF = this.offColor;
        this.colorG = this.offColor;
        break;
      case 2:
        this.colorA = this.onColor;
        this.colorB = this.onColor;
        this.colorC = this.offColor;
        this.colorD = this.onColor;
        this.colorE = this.onColor;
        this.colorF = this.offColor;
        this.colorG = this.onColor;
        break;
      case 3:
        this.colorA = this.onColor;
        this.colorB = this.onColor;
        this.colorC = this.onColor;
        this.colorD = this.onColor;
        this.colorE = this.offColor;
        this.colorF = this.offColor;
        this.colorG = this.onColor;
        break;
      case 4:
        this.colorA = this.offColor;
        this.colorB = this.onColor;
        this.colorC = this.onColor;
        this.colorD = this.offColor;
        this.colorE = this.offColor;
        this.colorF = this.onColor;
        this.colorG = this.onColor;
        break;
      case 5:
        this.colorA = this.onColor;
        this.colorB = this.offColor;
        this.colorC = this.onColor;
        this.colorD = this.onColor;
        this.colorE = this.offColor;
        this.colorF = this.onColor;
        this.colorG = this.onColor;
        break;
      case 6:
        this.colorA = this.onColor;
        this.colorB = this.offColor;
        this.colorC = this.onColor;
        this.colorD = this.onColor;
        this.colorE = this.onColor;
        this.colorF = this.onColor;
        this.colorG = this.onColor;
        break;
      case 7:
        this.colorA = this.onColor;
        this.colorB = this.onColor;
        this.colorC = this.onColor;
        this.colorD = this.offColor;
        this.colorE = this.offColor;
        this.colorF = this.offColor;
        this.colorG = this.offColor;
        break;
      case 8:
        this.colorA = this.onColor;
        this.colorB = this.onColor;
        this.colorC = this.onColor;
        this.colorD = this.onColor;
        this.colorE = this.onColor;
        this.colorF = this.onColor;
        this.colorG = this.onColor;
        break;
      case 9:
        this.colorA = this.onColor;
        this.colorB = this.onColor;
        this.colorC = this.onColor;
        this.colorD = this.onColor;
        this.colorE = this.offColor;
        this.colorF = this.onColor;
        this.colorG = this.onColor;
        break;
      default:
        this.colorA = this.offColor;
        this.colorB = this.offColor;
        this.colorC = this.offColor;
        this.colorD = this.offColor;
        this.colorE = this.offColor;
        this.colorF = this.offColor;
        this.colorG = this.offColor;
    }
  }
}

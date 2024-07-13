import { Component, Input } from '@angular/core';
import { timer } from 'rxjs';

@Component({
  selector: 'app-seven-segment',
  standalone: true,
  imports: [],
  templateUrl: './seven-segment.component.html',
})
export class SevenSegmentComponent {
  @Input() type: String;
  last = new Date().getTime();

  onColor = '#FF0000';
  offColor = '#F5E1E1';
  colorA = this.offColor;
  colorB = this.offColor;
  colorC = this.offColor;
  colorD = this.offColor;
  colorE = this.offColor;
  colorF = this.offColor;
  colorG = this.offColor;

  loopBitStates = ['80', '40', '20', '10', '8', '4'];
  numberBitStates = [
    'fc', // parseInt('11111100', 2).toString(16),
    '60', // parseInt('01100000', 2).toString(16),
    'da', // parseInt('11011010', 2).toString(16),
    'f2', // parseInt('11110010', 2).toString(16),
    '66', // parseInt('01100110', 2).toString(16),
    'b6', // parseInt('10110110', 2).toString(16),
    'be', // parseInt('10111110', 2).toString(16),
    'e0', // parseInt('11100000', 2).toString(16),
    'fe', // parseInt('11111110', 2).toString(16),
    'f6', // parseInt('11110110', 2).toString(16),
    'fa', // parseInt('11111010', 2).toString(16), // a
    '3e', // parseInt('00111110', 2).toString(16), // b
    '1a', // parseInt('00011010', 2).toString(16), // c
    '7a', // parseInt('01111010', 2).toString(16), // d
    '9e', // parseInt('10011110', 2).toString(16), // e
    '8e', // parseInt('10001110', 2).toString(16), // f
  ];

  current = 0;

  source = timer(0, 100);

  constructor() {
    this.type = 'timer';
  }

  ngOnInit() {
    this.source.subscribe(() => this.tick());
  }

  tick() {
    switch (this.type) {
      case 'clock':
        this.loop();
        // const date = new Date();
        // const seconds = date.getSeconds();
        // const minutes = date.getMinutes();
        // const hour = date.getHours();
        break;
      case 'timer':
        const now = new Date().getTime();
        if(now > this.last + 300) {
          this.next();
          this.last = now;
        }
        break;
      default:
        this.loop();
    }
  }

  loop() {
    this.current = (this.current + 1) % this.loopBitStates.length;
    this.setSegments(this.loopBitStates[this.current]);
  }

  next() {
    this.current = (this.current + 1) % 10;
    this.setSegments(this.numberBitStates[this.current]);
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

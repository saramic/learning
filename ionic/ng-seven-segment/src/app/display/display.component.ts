import { Component } from '@angular/core';
import { SevenSegmentComponent } from '../seven-segment/seven-segment.component';
import { Router, RouterModule } from '@angular/router';
import { timer } from 'rxjs';
import { CommonModule } from '@angular/common';
@Component({
  selector: 'app-display',
  standalone: true,
  imports: [SevenSegmentComponent, RouterModule, CommonModule],
  templateUrl: './display.component.html',
})
export class DisplayComponent {
  last = new Date().getTime();
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
  title = 'ng-seven-segment';
  type = 'loop';
  segments = ['fc', 'fc', 'fc', 'fc'];

  source = timer(0, 100);

  constructor(private router: Router) {}

  ngOnInit() {
    this.source.subscribe(() => this.tick());

    switch (this.router.url) {
      case '/clock':
        this.title = 'Clock';
        this.type = 'clock';
        break;
      case '/timer':
        this.title = 'Timer';
        this.type = 'timer';
        break;
      case '/loop':
        this.title = 'Loop';
        this.type = 'loop';
        break;
      default:
        this.title = 'ng-seven-segment';
    }
  }

  tick() {
    switch (this.type) {
      case 'clock':
        this.clock();
        break;
      case 'timer':
        const now = new Date().getTime();
        if (now > this.last + 100) {
          this.next();
          this.last = now;
        }
        break;
      default:
        this.loop();
    }
  }

  clock() {
    const date = new Date();
    const seconds = date.getSeconds().toString().padStart(2, '0').split("");
    const minutes = date.getMinutes().toString().padStart(2, '0').split("");
    const hours = date.getHours().toString().padStart(2, '0').split("");
    this.segments = [
      this.numberBitStates[parseInt(hours[0])],
      this.numberBitStates[parseInt(hours[1])],
      this.numberBitStates[parseInt(minutes[0])],
      this.numberBitStates[parseInt(minutes[1])],
      this.numberBitStates[parseInt(seconds[0])],
      this.numberBitStates[parseInt(seconds[1])],
    ]
  }

  loop() {
    this.current = (this.current + 1) % this.loopBitStates.length;
    this.segments = [
      this.loopBitStates[this.current],
      this.loopBitStates[this.current],
      this.loopBitStates[this.current],
      this.loopBitStates[this.current],
    ];
  }

  next() {
    this.current = (this.current + 1) % Math.pow(10, this.segments.length);
    this.current
      .toString()
      .padStart(this.segments.length, '0')
      .split('')
      .forEach((digit, index) => {
        this.segments[index] = this.numberBitStates[parseInt(digit)];
      });
  }
}

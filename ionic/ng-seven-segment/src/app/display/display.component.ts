import { Component } from '@angular/core';
import { SevenSegmentComponent } from '../seven-segment/seven-segment.component';

@Component({
  selector: 'app-display',
  standalone: true,
  imports: [SevenSegmentComponent],
  templateUrl: './display.component.html',
})
export class DisplayComponent {}

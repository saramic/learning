import { Component } from '@angular/core';
import { SevenSegmentComponent } from '../seven-segment/seven-segment.component';
import { Router, RouterModule } from '@angular/router';
@Component({
  selector: 'app-display',
  standalone: true,
  imports: [SevenSegmentComponent, RouterModule],
  templateUrl: './display.component.html',
})
export class DisplayComponent {
  title = 'ng-seven-segment';
  type = 'loop';
  constructor(private router: Router) {}
  ngOnInit() {
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
}

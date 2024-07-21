import { Component } from '@angular/core';
import {
  IonApp,
  IonToolbar,
  IonTitle,
  IonHeader,
  IonRouterOutlet,
} from '@ionic/angular/standalone';

@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  standalone: true,
  imports: [IonApp, IonHeader, IonTitle, IonToolbar, IonRouterOutlet],
})
export class AppComponent {
  constructor() {}
}

import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { RouterModule } from '@angular/router';
import {
  IonContent,
  IonHeader,
  IonTitle,
  IonToolbar,
  IonLabel,
  IonItem,
  IonSpinner,
} from '@ionic/angular/standalone';

@Component({
  standalone: true,
  selector: 'app-host',
  templateUrl: './host.component.html',
  styleUrls: ['./host.component.scss'],
  imports: [
    CommonModule,
    IonContent,
    IonHeader,
    IonItem,
    IonLabel,
    IonItem,
    IonSpinner,
    IonTitle,
    IonToolbar,
    RouterModule,
  ],
})
export class HostComponent implements OnInit {
  constructor() {}

  ngOnInit() {}
}

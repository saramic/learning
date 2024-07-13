import { Routes } from '@angular/router';
import { DisplayComponent } from './display/display.component';

export const routes: Routes = [
  { path: 'clock', component: DisplayComponent },
  { path: 'timer', component: DisplayComponent },
  { path: 'loop', component: DisplayComponent },
  { path: '', redirectTo: 'loop', pathMatch: 'full' },
];

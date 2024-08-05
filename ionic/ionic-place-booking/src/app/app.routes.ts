import { Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: '',
    redirectTo: 'places',
    pathMatch: 'full',
  },
  {
    path: 'auth',
    loadComponent: () => import('./auth/auth.page').then( m => m.AuthPage)
  },
  {
    path: 'places',
    loadChildren: () => import('./places/places.routes').then( m => m.routes)
  },
  {
    path: 'bookings',
    loadComponent: () => import('./bookings/bookings.page').then( m => m.BookingsPage)
  },
];

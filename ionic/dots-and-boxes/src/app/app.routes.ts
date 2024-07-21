import { Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full',
  },
  {
    path: 'game',
    children: [
      {
        path: '',
        loadComponent: () => import('./game/game.page').then( m => m.GamePage)
      },
      {
        path: 'host',
        loadComponent: () => import('./game/host/host.component').then( m => m.HostComponent),
      },
      {
        path: 'join',
        loadComponent: () => import('./game/join/join.component').then( m => m.JoinComponent),
      },
      {
        path: ':numberPlayers',
        loadComponent: () => import('./game/game.page').then( m => m.GamePage)
      }
    ]
  },
  {
    path: 'home',
    loadComponent: () => import('./home/home.page').then( m => m.HomePage)
  },
];

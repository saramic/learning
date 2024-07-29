import { Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: 'home',
    loadComponent: () => import('./home/home.page').then((m) => m.HomePage),
  },
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full',
  },
  {
    path: 'auth',
    loadComponent: () => import('./auth/auth.page').then( m => m.AuthPage)
  },
  {
    path: 'places',
    loadComponent: () => import('./places/places.page').then( m => m.PlacesPage)
  },
  {
    path: 'discover',
    loadComponent: () => import('./places/discover/discover.page').then( m => m.DiscoverPage)
  },
  {
    path: 'offers',
    loadComponent: () => import('./places/offers/offers.page').then( m => m.OffersPage)
  },
  {
    path: 'new-offer',
    loadComponent: () => import('./places/offers/new-offer/new-offer.page').then( m => m.NewOfferPage)
  },
  {
    path: 'edit-offer',
    loadComponent: () => import('./places/offers/edit-offer/edit-offer.page').then( m => m.EditOfferPage)
  },
  {
    path: 'place-detail',
    loadComponent: () => import('./places/discover/place-detail/place-detail.page').then( m => m.PlaceDetailPage)
  },
  {
    path: 'offer-bookings',
    loadComponent: () => import('./places/offers/offer-bookings/offer-bookings.page').then( m => m.OfferBookingsPage)
  },
  {
    path: 'bookings',
    loadComponent: () => import('./bookings/bookings.page').then( m => m.BookingsPage)
  },
];

import { Routes } from '@angular/router';
import { DiscoverPage } from './discover/discover.page';
import { OffersPage } from './offers/offers.page';
import { PlaceDetailPage } from './discover/place-detail/place-detail.page';
import { NewOfferPage } from './offers/new-offer/new-offer.page';
import { EditOfferPage } from './offers/edit-offer/edit-offer.page';
import { OfferBookingsPage } from './offers/offer-bookings/offer-bookings.page';

export const routes: Routes = [
  {
    path: 'tabs',
    loadComponent: () => import('./places.page').then(m => m.PlacesPage),
    children: [
      {
        path: 'discover',
        children: [
          {
            path: '',
            component: DiscoverPage,
          },
          {
            path: ':placeId',
            component: PlaceDetailPage,
          },
        ],
      },
      {
        path: 'offers',
        children: [
          {
            path: '',
            component: OffersPage,
          },
          {
            path: 'new',
            component: NewOfferPage
          },
          {
            path: 'edit/:placeId',
            component: EditOfferPage
          },
          {
            path: ':placeId',
            component: OfferBookingsPage
          },
        ],
      },
      {
        path: '',
        redirectTo: '/places/tabs/discover',
        pathMatch: 'full',
      },
    ],
  },
  {
    path: '',
    redirectTo: '/places/tabs/discover',
    pathMatch: 'full',
  },
];

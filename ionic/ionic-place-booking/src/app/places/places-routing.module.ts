import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: 'tabs',
    loadComponent: () => import('./places.page').then( m => m.PlacesPage),
    children: [
      {
        path: 'discover',
        children: [
          {
            path: '',
            loadChildren: () =>
              import('./discover/discover.page').then((m) => m.DiscoverPage),
          },
          {
            path: ':placeId',
            loadChildren: () =>
              import('./discover/place-detail/place-detail.page').then(
                (m) => m.PlaceDetailPage
              ),
          },
        ],
      },
      {
        path: 'offers',
        children: [
          {
            path: '',
            loadChildren: () =>
              import('./offers/offers.page').then((m) => m.OffersPage),
          },
          {
            path: 'new',
            loadChildren: () =>
              import('./offers/new-offer/new-offer.page').then(
                (m) => m.NewOfferPage
              ),
          },
          {
            path: 'edit/:placeId',
            loadChildren: () =>
              import('./offers/edit-offer/edit-offer.page').then(
                (m) => m.EditOfferPage
              ),
          },
          {
            path: ':placeId',
            loadChildren: () =>
              import('./offers/offer-bookings/offer-bookings.page').then(
                (m) => m.OfferBookingsPage
              ),
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

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class PlacesRoutingModule {}

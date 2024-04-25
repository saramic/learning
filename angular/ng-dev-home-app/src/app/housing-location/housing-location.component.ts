import { Component, Input } from '@angular/core';
import { HousingLocation } from '../housinglocation';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-housing-location',
  standalone: true,
  imports: [RouterModule],
  template: `
    <section class="listing">
      <img
        class="listing-photo"
        [src]="housingLocation.photo"
        alt="Exterior photo"
        crossorigin
      />
      <h2 class="listing-heading">
        {{ housingLocation.name }}
      </h2>
      <p class="listing-location">
        {{ housingLocation.city }}
      </p>
      <a [routerLink]="['/details', housingLocation.id]">
        Learn More
      </a>
    </section>
  `,
  styleUrl: './housing-location.component.css'
})
export class HousingLocationComponent {
  @Input() housingLocation!: HousingLocation;
}

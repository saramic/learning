import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { PersonsComponent } from './persons/persons.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, PersonsComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'ng-refresher';
}

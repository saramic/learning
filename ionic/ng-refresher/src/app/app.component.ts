import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { PersonsComponent } from './persons/persons.component';
import { PersonInputComponent } from './person-input/person-input.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, PersonsComponent, PersonInputComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  title = 'ng-refresher';
  persons = ['Max', 'Manuel', 'Anna'];
}

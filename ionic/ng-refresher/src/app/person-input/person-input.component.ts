import { Component } from '@angular/core';

@Component({
  selector: 'app-person-input',
  standalone: true,
  imports: [],
  templateUrl: './person-input.component.html',
  styleUrl: './person-input.component.css'
})
export class PersonInputComponent {
  onCreatePerson(name: string) {
    console.log('Created a person!', name);
  }
}

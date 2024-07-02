import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { PersonsService } from '../persons/persons.service';

@Component({
  selector: 'app-person-input',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './person-input.component.html',
  styleUrl: './person-input.component.css'
})
export class PersonInputComponent {
  enteredPersonName = "";
  constructor(private personsService: PersonsService) {
  }

  onCreatePerson() {
    console.log('Created a person!', this.enteredPersonName);
    this.personsService.addPerson(this.enteredPersonName);
    this.enteredPersonName = "";
  }
}

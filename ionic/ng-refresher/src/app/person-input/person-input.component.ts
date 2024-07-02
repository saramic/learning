import { Component, Output, EventEmitter } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-person-input',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './person-input.component.html',
  styleUrl: './person-input.component.css'
})
export class PersonInputComponent {
  @Output() personCreate = new EventEmitter<string>();
  enteredPersonName = "";
  onCreatePerson() {
    console.log('Created a person!', this.enteredPersonName);
    this.personCreate.emit(this.enteredPersonName);
    this.enteredPersonName = "";
  }
}

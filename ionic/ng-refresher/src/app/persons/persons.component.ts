import { Component } from '@angular/core';
import { NgFor } from '@angular/common';
import { PersonsService } from './persons.service';

@Component({
  selector: 'app-persons',
  standalone: true,
  imports: [NgFor],
  templateUrl: './persons.component.html',
  styleUrl: './persons.component.css'
})
export class PersonsComponent {
  personList: string[] = [];
  private personService: PersonsService;

  constructor(personsService: PersonsService) {
    // this.personList = personsService.persons;
    this.personService = personsService;
  }

  // use NG lifecycle hooks
  // https://angular.dev/guide/components/lifecycle
  ngOnInit() {
    this.personList = this.personService.persons
  }
}

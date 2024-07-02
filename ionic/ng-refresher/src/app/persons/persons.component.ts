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

  constructor(private personsService: PersonsService) {
  }

  // use NG lifecycle hooks
  // https://angular.dev/guide/components/lifecycle
  ngOnInit() {
    this.personList = this.personsService.persons
  }

  onRemovePerson(name: string) {
    this.personsService.removePerson(name);
  }
}

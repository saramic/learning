import { Component, OnDestroy } from '@angular/core';
import { NgFor } from '@angular/common';
import { PersonsService } from './persons.service';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-persons',
  standalone: true,
  imports: [NgFor],
  templateUrl: './persons.component.html',
  styleUrl: './persons.component.css'
})
export class PersonsComponent implements OnDestroy{
  personList: string[] = [];
  private personListSubscription: Subscription | null = null;

  constructor(private personsService: PersonsService) {
  }

  // use NG lifecycle hooks
  // https://angular.dev/guide/components/lifecycle
  ngOnInit() {
    this.personListSubscription = this.personsService.personsChanged.subscribe(persons => {
      this.personList = persons
    });
    this.personsService.fetchPersons();
  }

  onRemovePerson(name: string) {
    this.personsService.removePerson(name);
  }

  ngOnDestroy() {
    this.personListSubscription?.unsubscribe();
  }
}

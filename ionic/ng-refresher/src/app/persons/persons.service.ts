import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class PersonsService {
  persons: string[] = ['Max', 'Manuel', 'Anna'];

  constructor() { }

  addPerson(name: string) {
    this.persons.push(name);
  }

  removePerson(name: string) {
    this.persons = this.persons.filter(person => person !== name);
  }
}

import moment from 'moment';
import twix from 'twix';

export default class AgeCalculator {
  constructor() {
  }

  digitsFor(args) {
    const { person, date } = args;
    const age = person.at(date);
    return extractSortedUniqueDigits(age)
  }

  daysUniqeBetween(persons, dateStart, dateEnd) {
    const result = persons.reduce( (a, b) => { a[b.name] = 0; return a }, {});
    const acc = [];
    var iter = moment.twix(dateStart, dateEnd).iterate("days");
    while(iter.hasNext()){
      acc.push(iter.next().toDate())
    }
    acc.forEach(day => {
      const unique = this.uniqueDigitsByPerson(persons, day);
      persons.forEach(person => {
        if(unique[person.name]) {
          result[person.name] += unique[person.name].length;
        }
      })
    });
    return result;
  }

  uniqueDigitsByPerson(persons, date) {
    const personCounts = this.personCounts(persons, date);
    const duplicates = findDuplicates(flatten(values(personCounts)));
    return this.removePersonCountsDuplicates(personCounts, duplicates);
  }

  removePersonCountsDuplicates(personCounts, duplicates) {
    return Object.keys(personCounts).reduce( (a, b) =>
        this.uniqValuesOnly(personCounts, duplicates, a, b), {});
  }

  uniqValuesOnly(personCounts, duplicates, personCountsUniq, key) {
      const uniqVals = filterOutDuplicateVals(personCounts[key], duplicates);
      return uniqVals.length === 0 ?
        personCountsUniq :
        Object.assign(personCountsUniq, { [key] : uniqVals});
  }

  personCounts(persons, date) {
    const personCounts = {}
    persons.map((person) => {
      personCounts[person.name] =
        this.digitsFor({person: person, date: date});
    });
    return personCounts;
  }
}

const filterOutDuplicateVals = (vals, duplicates) =>
  vals.filter(val => !duplicates.includes(val));

const extractSortedUniqueDigits = number =>
  deDuplicate(numberToIntArray(number).sort());

const numberToIntArray = number =>
  number
  .toString()
  .split('')
  .map((item, index) => {
    return parseInt(item);
  });

const values = list => Object.keys(list).map(x => list[x]);

const flatten = list => list.reduce( (a, b) =>
    a.concat(Array.isArray(b) ? flatten(b) : b), []
);

const findDuplicates = (list) => {
  const sortedList = list.slice().sort();
  const duplicates = [];
  sortedList.map((element, index) => {
    if(sortedList[index + 1] === sortedList[index]) {
      duplicates.push(element);
    }
  })
  return deDuplicate(duplicates);
}

const deDuplicate = (list) => Array.from(new Set(list));

export class Person {
  constructor(name, dob) {
    this.dob = new Date(dob);
    this.name = name;
  }

  at(date) {
    const dateDiff = new Date(date - this.dob);
    return Math.abs(dateDiff.getUTCFullYear() - 1970);
  }
}

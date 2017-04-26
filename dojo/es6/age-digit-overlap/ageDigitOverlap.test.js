import AgeCalculator, { Person } from './ageCalculator'

const date = new Date("2017-04-26");
const ageCalculator = new AgeCalculator();
const person6 = new Person("p6", "1975-10-30");
const person5 = new Person("p5", "1978-02-21");
const person4 = new Person("p4", "2004-08-08");
const person3 = new Person("p3", "2006-08-28");
const person2 = new Person("p2", "2011-03-14");
const person1 = new Person("p1", "2013-10-17");

test("it should return the digit for an age at a particular date", () => {
  expect(ageCalculator.digitsFor({"person": person6, "date": date})).toEqual([1,4]);
})

test("digits for another person", () => {
  expect(ageCalculator.digitsFor({"person": person4, "date": date})).toEqual([1,2]);
})

test("Digits are unique", () => {
  const dateAge11 = new Date("1989-02-21");
  expect(ageCalculator.digitsFor({"person": person5, "date": dateAge11})).toEqual([1]);
})

test("calculate unique digits between a number of people on a given date", () => {
  const persoms = [person1, person2, person3, person4, person5, person6];
  expect(ageCalculator.uniqueDigitsByPerson(persoms, date)).toEqual(
      {"p2": [6], "p3": [0], "p4": [2], p5: [9], p6: [4]});
})

test("calculate for another year", () => {
  const persoms = [person1, person2, person3, person4, person5, person6];
  expect(ageCalculator.uniqueDigitsByPerson(persoms, new Date('2016-04-26'))).toEqual(
      {"p2": [5], "p1": [2], "p3": [9], "p4": [1], "p5": [3, 8], "p6": [0, 4]});
})

// TODO deal with pre birth

test("days with unique digit between 2 dates", () => {
  const persoms = [person1, person2, person3, person4, person5, person6];
  expect(ageCalculator.daysUniqeBetween(
        persoms,
        new Date('2016-03-26'),
        new Date('2016-04-26')
  )).toEqual(
      {p1: 32, p2: 32, p3: 32, p4: 32, p5: 64, p6: 64});
})

test("days with unique digit between 2 dates", () => {
  const persoms = [person1, person2, person3, person4, person5, person6];
  expect(ageCalculator.daysUniqeBetween(
        persoms,
        new Date('2016-03-13'),
        new Date('2016-04-26')
        // TODO
        // off by 1 day rounding?
        // should this go to the last person turning 100?
        // or death?
        //new Date('1975-10-30'),
        //new Date('2075-10-30')
        // {"p1": 23411, "p2": 25774, "p3": 23013,
        //  "p4": 24911, "p5": 27532, "p6": 25041}
  )).toEqual(
      {p1: 45, p2: 44, p3: 45, p4: 45, p5: 90, p6: 89});
    
})

// Person
test("Person knows their age on a given date", () => {
  expect(person2.at(date)).toEqual(6);
})

test("Any Person knows their age on a given date", () => {
  expect(person3.at(date)).toEqual(10);
})

test("Person has a name", () => {
  expect(person2.name).toEqual('p2');
})


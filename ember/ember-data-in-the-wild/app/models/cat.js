import DS from 'ember-data';

const { Model, attr } = DS

export default Model.extend({
  name: attr('string'),
  age: attr('number'),
  adopted: attr('boolean'),
  birthday: attr('date')
});

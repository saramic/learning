import DS from 'ember-data';

const { JSONAPIAdapter } = DS;

export default JSONAPIAdapter.extend({
  host: 'http://localhost:8000',
  namespace: 'api/v1'
});
// test('it exists', function(assert) {
//   var adapter = this.subject();
//   adapter.set('session', {userType: "customer"})
//   assert.ok(adapter);
// });


// adapter.set('session', {userType: "customer"})
// assert.equal(adapter.urlForFindRecord(), '/api/v1/my/customers/profile');

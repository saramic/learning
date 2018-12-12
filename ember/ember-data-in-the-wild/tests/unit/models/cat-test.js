import {moduleForModel, test} from 'ember-qunit';
import {run} from '@ember/runloop'

moduleForModel('cat', 'Unit | Model | cat', {
  // Specify the other units that are required for this test.
  needs: []
});

test('it exists', function (assert) {
  let model = this.subject();
  // let store = this.store();
  assert.ok(!!model);
});

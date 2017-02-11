//const tennis = require('./tennis');
import tennis from './tennis';

test('neither player has scored', () => {
  expect((new tennis).score(0, 0)).toBe('love all');
});

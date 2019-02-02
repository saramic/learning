/***
 * Excerpted from "Test-Driven React",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material,
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose.
 * Visit http://www.pragmaticprogrammer.com/titles/tbreact for more book information.
***/
module.exports = function(wallaby) {
  return {
    testFramework: 'jest',

    env: {
      type: 'node',
    },

    tests: ['src/tests/**/*.test.js'],
    files: ['src/**/*.js', '!**/*.test.js', '!**/.*'],

    compilers: {
      '**/*.js': wallaby.compilers.babel(),
    },
  };
};

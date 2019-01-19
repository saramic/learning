const fizzBuzz = require ('./index');

describe('fizzBuzz()', () => {
    it('returns "FizzBuzz" for multiples of 3 and 5', () => {
        expect(fizzBuzz(15)).toBe('FizzBuzz');
        expect(fizzBuzz(30)).toBe('FizzBuzz');
    })
    it('returns "Fizz" for multiples of 3', () => {
        expect(fizzBuzz(3)).toBe('Fizz');
        expect(fizzBuzz(9)).toBe('Fizz');
    })
    it('returns "Buzz" for multiples of 5', () => {
        expect(fizzBuzz(5)).toBe('Buzz');
        expect(fizzBuzz(10)).toBe('Buzz');
    })
})
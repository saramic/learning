
const greeting = (guest) => `Hello, ${guest}!`;

describe('greeting()', () => {
    it('says hello', () => {
        expect(greeting('Jest')).toBe('Hello, Jest!');
    });
});

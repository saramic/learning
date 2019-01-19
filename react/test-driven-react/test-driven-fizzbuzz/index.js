module.exports = (num) => {
    return (num % 15 === 0) ? 'FizzBuzz' :
        (num % 5 === 0) ? 'Buzz' :
        (num % 3 === 0) ? 'Fizz' :
        `${num}`;
}

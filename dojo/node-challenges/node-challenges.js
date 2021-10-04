function isEven(number) {
  return number % 2 === 0;
}

function sumAll(arr) {
  // NOTE: non nested would work
  // return arr.reduce((prev, curr) => prev + curr, 0);
  return arr.reduce(
    (prev, element) =>
      prev + (element instanceof Array ? sumAll(element) : element),
    0
  );
}

export { isEven, sumAll }; // eslint-disable-line import/prefer-default-export

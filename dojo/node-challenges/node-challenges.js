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

function stringify(obj) {
  const output = [];
  if (obj instanceof Array) {
    output.push(`[${obj.map((element) => stringify(element))}]`);
  } else if (obj instanceof Object) {
    output.push(
      `{${Object.keys(obj)
        .map((key) => `"${key}":${stringify(obj[key])}`)
        .join(",")} }`
    );
  }
  if (typeof obj === "string") {
    output.push(`"${obj}"`);
  }
  if (typeof obj === "number") {
    output.push(obj);
  }
  if (typeof obj === "boolean") {
    output.push(obj ? "true" : "false");
  }
  return output.join();
}

export { isEven, sumAll, stringify }; // eslint-disable-line import/prefer-default-export

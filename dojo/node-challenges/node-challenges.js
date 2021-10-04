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

function all(promises) {
  return new Promise((resolve, reject) => {
    const results = [];
    let count = 0;
    promises.forEach((promise, index) => {
      Promise.resolve(promise).then((response) => {
        results[index] = response;
        count += 1;
        if (count === promises.length) {
          resolve(results);
        }
      });
    });
  });
}

function allReduce(promises) {
  return promises.reduce((acc, promise) => {
    return acc.then((results) => {
      return Promise.resolve(promise).then((result) => {
        return [...results, result];
      });
    });
  }, Promise.resolve([]));
}

export { isEven, sumAll, stringify, all, allReduce }; // eslint-disable-line import/prefer-default-export

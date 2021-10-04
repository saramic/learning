import { isEven, sumAll, stringify, all, allReduce } from "./node-challenges";

describe("isEven", () => {
  test("checks a number if it is even", () => {
    expect(isEven(5)).toBeFalsy;
    expect(isEven(4)).toBeTruthy;
  });
});

describe("sumAll", () => {
  test("sums a plain old array", () => {
    expect(sumAll([1, 2, 3])).toBe(6);
  });
  test("sums a blank array", () => {
    expect(sumAll([])).toBe(0);
  });
  test("sums negative numbers", () => {
    expect(sumAll([2, 2, -3, -1])).toBe(0);
  });
  test("sums nested numbers", () => {
    expect(sumAll([1, 2, 3, [4, 5, [6, 7], 8], 9])).toBe(45);
  });
});

describe("stringify", () => {
  test("stringify an empty hash", () => {
    expect(stringify({}).replace(/\s+/g, "")).toEqual("{}");
  });
  test("a hash with all the things", () => {
    expect(
      stringify({
        foo: "bar",
        num: 7,
        nested: { going: "deeper" },
        arr: [1, 2],
      }).replace(/\s+/g, "")
    ).toEqual('{"foo":"bar","num":7,"nested":{"going":"deeper"},"arr":[1,2]}');
  });
  test("an object with a boolean", () => {
    expect(stringify({ a: false }).replace(/\s+/g, "")).toEqual('{"a":false}');
  });
  test("an object with a boolean", () => {
    expect(stringify([false, "hello", 1]).replace(/\s+/g, "")).toEqual(
      '[false,"hello",1]'
    );
  });
});

describe("promise all", () => {
  test("resolves a promise using all", async () => {
    expect.assertions(1);

    const p1 = new Promise((res) => res("a"));
    const p2 = new Promise((res) => res("b"));
    const p3 = new Promise((res) => res("c"));

    await expect(all([p1, p2, p3])).resolves.toEqual(["a", "b", "c"]);
  });

  test("resolves a promise using allReduce", async () => {
    expect.assertions(1);

    const p1 = new Promise((res) => res("a"));
    const p2 = new Promise((res) => res("b"));
    const p3 = new Promise((res) => res("c"));

    await expect(allReduce([p1, p2, p3])).resolves.toEqual(["a", "b", "c"]);
  });
});

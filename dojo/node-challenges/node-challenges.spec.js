import { isEven, sumAll } from "./node-challenges";

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

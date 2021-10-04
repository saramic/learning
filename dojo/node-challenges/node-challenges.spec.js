import { isEven } from "./node-challenges";

describe("isEven", () => {
  test("checks a number if it is even", () => {
    expect(isEven(5)).toBeFalsy;
    expect(isEven(4)).toBeTruthy;
  });
});

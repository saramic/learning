import { handleInput, handleLogic} from './group_calculator';

describe("group calculator", () => {
  it("it hanldes an array of input", () => {
    const input = [
      {
        id: 1,
        logic: "all",
        rules: [1, 2],
        rule_group_ids: [2]
      },
      {
        id: 2,
        logic: "any",
        rules: [3, 4],
        rule_group_ids: []
      }
    ]
    expect(handleInput(input)).toEqual(true);
  });

  it("returns TRUE for Any/some logic if any value is present", () => {
    expect(
      handleLogic(
        "some",
        {
          id: 1, logic: "any",
          rules: [1,2,3,4,5,6], rule_group_ids: [1]
        }
      )
    ).toEqual(true);
  });

  it("returns FALSE for Any/some logic if no value is present", () => {
    expect(
      handleLogic(
        "some",
        {
          id: 1, logic: "any",
          rules: [1,2,3,4,5,6], rule_group_ids: [7]
        }
      )
    ).toEqual(false);
  });

  it("returns TRUE for All/every logic if ALL values are present", () => {
    expect(
      handleLogic(
        "every",
        {
          id: 1, logic: "all",
          rules: [1,2,3,4,5,6], rule_group_ids: [1,2,3,4,5,6]
        }
      )
    ).toEqual(true);
  });

  it("returns FALSE for All logic if even 1 value is missing", () => {
    expect(
      handleLogic(
        "every",
        {
          id: 1, logic: "all",
          rules: [1,2,3,4,5], rule_group_ids: [1,2,3,4,5,6]
        }
      )
    ).toEqual(false);
  });
});

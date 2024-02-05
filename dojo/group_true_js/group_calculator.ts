type LogicType = "all" | "any";
type InputType = {
  id: number,
  logic: LogicType,
  rules: number[],
  rule_group_ids: number[],
};
type LogicMethod = "every" | "some";
type LogicHandlers = {
  [key in LogicType]: LogicMethod;
};

const handleLogic = (method: LogicMethod, input: InputType): boolean => {
  return input.rule_group_ids[method](rule_group_id => !!input.rules.find(rule => rule === rule_group_id))
}

const logicHandlers: LogicHandlers = {
  "all": "every",
  "any": "some",
};

const handleInput = (inputs: InputType[]): boolean => {
  return !!inputs.find((input) => handleLogic(logicHandlers[input.logic], input))
}

// export default () => true;
export { handleInput, handleLogic };

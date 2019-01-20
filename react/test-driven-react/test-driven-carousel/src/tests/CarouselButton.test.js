import React from "react";
import { configure, shallow } from "enzyme";
import Adapter from "enzyme-adapter-react-16";
import CarouselButton from "../CarouselButton";

configure({ adapter: new Adapter() });

describe("CarouselButton", () => {
  const text = "Button text";
  let wrapper;

  beforeEach(() => {
    wrapper = shallow(<CarouselButton>{text}</CarouselButton>);
  });

  it("renders a <button>", () => {
    expect(wrapper.type()).toBe("button");
  });

  it("passes `children` trough to the <button>", () => {
    expect(wrapper.prop("children")).toBe(text);
  });

  it("passes other props through to the <button>", () => {
    const onClick = () => {};
    const className = "my-carousel-button";
    const dataAction = "prev";
    wrapper.setProps({ onClick, className, "data-action": dataAction });
    expect(wrapper.prop("onClick")).toBe(onClick);
    expect(wrapper.prop("className")).toBe(className);
    expect(wrapper.prop("data-action")).toBe(dataAction);
  });
});

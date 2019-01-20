import React from "react";
import { shallow } from "enzyme";
import CarouselSlide from "../CarouselSlide";

describe("CarouseSlide", () => {
  let wrapper;

  beforeEach(() => {
    wrapper = shallow(<CarouselSlide />);
  });

  it("renders a <figure>", () => {
    expect(wrapper.type()).toBe("figure");
  });

  it("renders an <img> and a <figcaption> as children", () => {
    expect(wrapper.childAt(0).type()).toBe("img");
    expect(wrapper.childAt(1).type()).toBe("figcaption");
  });

  it("passes `imgUrl` through to the <img>", () => {
    const imgUrl = "https://example.com/image.png";
    wrapper.setProps({ imgUrl });
    const img = wrapper.find("img");
    expect(img.prop("src")).toBe(imgUrl);
  });
});

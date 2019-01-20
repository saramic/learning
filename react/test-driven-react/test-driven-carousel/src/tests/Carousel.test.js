import React from "react";
import { shallow } from "enzyme";
import Carousel from "../Carousel";
import CarouselButton from "../CarouselButton";
import CarouselSlide from "../CarouselSlide";

describe("Carousel", () => {
  let wrapper;

  const slides = [
    {
      imgUrl: "https://example.com/slide1.png",
      description: "Slide 1",
      attribution: "Uno Pizzeria"
    },
    {
      imgUrl: "https://example.com/slide2.png",
      description: "Slide 2",
      attribution: "Dos Equis"
    },
    {
      imgUrl: "https://example.com/slide3.png",
      description: "Slide 3",
      attribution: "Three Amigos"
    }
  ];

  beforeEach(() => {
    wrapper = shallow(<Carousel slides={slides} />);
  });

  it("renders a <div>", () => {
    expect(wrapper.type()).toBe("div");
  });

  it("has an initial `slideIndex` of 0", () => {
    expect(wrapper.state("slideIndex")).toBe(0);
  });

  it('renders a CarouselButton labeld "Prev"', () => {
    expect(
      wrapper
        .find(CarouselButton)
        .at(0)
        .prop("children")
    ).toBe("Prev");
  });

  it('renders a CarouselButton labeld "Next"', () => {
    expect(
      wrapper
        .find(CarouselButton)
        .at(1)
        .prop("children")
    ).toBe("Next");
  });

  describe("with a middle slide selected", () => {
    beforeEach(() => {
      wrapper.setState({ slideIndex: 1 });
    });

    it("decrements `slideIndex` when the Prev button is clicked", () => {
      wrapper.setState({ slideIndex: 1 });
      wrapper.find('[data-action="prev"]').simulate("click");
      expect(wrapper.state("slideIndex")).toBe(0);
    });

    it("increments `slideIndex` when the Next button is clicked", () => {
      wrapper.setState({ slideIndex: 1 });
      wrapper.find('[data-action="next"]').simulate("click");
      expect(wrapper.state("slideIndex")).toBe(2);
    });
  });

  describe("with the first slide selected", () => {
    it("wraps `slideIndex` to the max value when the Prev button is clicked", () => {
      wrapper.setState({ slideIndex: 0 });
      wrapper.find('[data-action="prev"]').simulate("click");
      expect(wrapper.state("slideIndex")).toBe(slides.length - 1);
    });
  });

  describe("with the last slide selected", () => {
    it("wraps `slideIndex` to the max value when the Next button is clicked", () => {
      wrapper.setState({ slideIndex: slides.length - 1 });
      wrapper.find('[data-action="next"]').simulate("click");
      expect(wrapper.state("slideIndex")).toBe(0);
    });
  });

  it("renders the current slide as a CarouselSlide", () => {
    let slideProps;
    slideProps = wrapper.find(CarouselSlide).props();
    expect(slideProps).toEqual(slides[0]);
    wrapper.setState({ slideIndex: 1 });
    slideProps = wrapper.find(CarouselSlide).props();
    expect(slideProps).toEqual(slides[1]);
  });
});

import React from "react";
import CarouselButton from "./CarouselButton";

class Carousel extends React.PureComponent {
  state = {
    slideIndex: 0
  };

  render() {
    return (
      <div>
        <CarouselButton>Prev</CarouselButton>
        <CarouselButton>Next</CarouselButton>
      </div>
    );
  }
}

export default Carousel;

import React from "react";

const CarouselSlide = ({ imgUrl, description, attribution, ...rest }) => (
  <figure {...rest}>
    <img src={imgUrl} />
    <figcaption>
      <strong>{description}</strong> {attribution}
    </figcaption>
  </figure>
);

export default CarouselSlide;

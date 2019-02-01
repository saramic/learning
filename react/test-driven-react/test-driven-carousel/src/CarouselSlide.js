import React from "react";
import propTypes from "prop-types";

const CarouselSlide = ({ imgUrl, description, attribution, ...rest }) => (
  <figure {...rest}>
    <img src={imgUrl} />
    <figcaption>
      <strong>{description}</strong> {attribution}
    </figcaption>
  </figure>
);

CarouselSlide.propTypes = {
  imgUrl: propTypes.string.isRequired,
  description: propTypes.string.isRequired,
  attribution: propTypes.node
};

export default CarouselSlide;

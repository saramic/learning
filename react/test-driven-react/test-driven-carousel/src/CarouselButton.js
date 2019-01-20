import React from "react";
import propTypes from "prop-types";

const CarouselButton = props => <button {...props} />;

CarouselButton.propTypes = {
  children: propTypes.node.isRequired
};
export default CarouselButton;

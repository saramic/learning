import React, { createElement } from "react";
import { render } from "react-dom";

render(
  createElement("div", null, "Hello React"),
  document.getElementById("root")
);


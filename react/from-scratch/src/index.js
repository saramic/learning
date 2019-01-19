import React, { createElement } from "react";
import { render } from "react-dom";

render(
  <div>
    { createElement("h1", null, "Hello React") }
  </div>,
  document.getElementById("root")
);


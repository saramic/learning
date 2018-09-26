import React, { Component } from "react"
import { render } from "react-dom"

class App extends Component {
  render() {
    return (
      <div className="app">
        hello
      </div>
    )
  }
}

render(
  <App />,
  document.getElementById("root")
)

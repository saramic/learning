import React from 'react'
import { render } from 'react-dom'

class Secret extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      name: 'top secret!',
    }
    this.onButtonClick = this.onButtonClick.bind(this)
  }

  onButtonClick() {
    this.setState(() => ({
      name: 'Mark'
    }))
  }

  render () {
    return (
      React.createElement(
        "div",
        null,
        React.createElement(
          "h1",
          null,
          "My name is " + this.state.name
        ),
        React.createElement(
          "button",
          { onClick: this.onButtonClick },
          "reveal the secret!"
        )
      )
    )
  }
}

render(
  React.createElement(Secret),
  document.getElementById('root')
)


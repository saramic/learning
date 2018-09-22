import React from "react"
import { render } from "react-dom"
import PropTypes from "prop-types"

class Counter extends React.Component {
  static PropTypes = {
    incrementBy: PropTypes.number,
    onIncrement: PropTypes.func.isRequired
  }
  static defaultProps = {
    incrementBy: 1
  }

  constructor(props) {
    super(props)
    this.state = {
      count: 0
    }
    this.onButtonClick = this.onButtonClick.bind(this)
  }

  onButtonClick() {
    this.setState(function(prevState, props) {
      return { count : prevState.count + props.incrementBy }
    })
  }

  render() {
    return (
      <div>
        <h1>{this.state.count}</h1>
        <button onClick={this.onButtonClick}>++</button>
      </div>
    )
  }
}

export default Counter

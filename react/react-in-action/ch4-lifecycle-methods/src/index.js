import PropTypes from "prop-types"
import React, { Component } from "react"
import { render } from "react-dom"

class ChildComponent extends Component {
  static propTypes = {
    name: PropTypes.string
  }
  static defaultProps = (function() {
    console.log("ChildComponent: defaultProps")
    return {}
  })()

  constructor(props) {
    super(props)
    console.log("ChildComponent: state")
  }

  render () {
    console.log("ChildComponent: render")
    return (
      <div>
        Name: {this.props.name}
      </div>
    )
  }
}

class ParentComponent extends Component {
  constructor(props) {
    super(props)
    this.state = {
      name: ''
    }
    this.onInputChange = this.onInputChange.bind(this)
  }
  onInputChange(e) {
    this.setState({ text: e.target.value })
  }
  render () {
    console.log("ParentComponent: render")
    return [
      <h2 key="h2">learn about rendering and lifecycle methods!</h2>,
      <input key="input" value={this.state.text} onChange={this.onInputChange} />,
      <ChildComponent key="ChildComponent" name={this.state.text} />
    ]
  }
}

render(
  <ParentComponent />,
  document.getElementById('root')
)


import React from "react"
import { render } from "react-dom"
import PropTypes from "prop-types"

function Greeting(props) {
  return <div>Hello {props.for}!</div>
}

Greeting.propTypes = {
  for: PropTypes.string.isRequired
}

Greeting.defaultProps = {
  for: 'friend'
}

export default Greeting

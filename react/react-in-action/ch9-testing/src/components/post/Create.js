import PropTypes from "prop-types"
import React, { Component } from "react"
import { render } from "react-dom"
import Filter from "bad-words"

class CreatePost extends Component {
  static propTypes = {
    onSubmit: PropTypes.func.isRequired
  }

  constructor(props) {
    super(props)
    this.initialState = {
      content: ""
    }
    this.state = this.initialState
    this.filter = new Filter()
    this.handlePostChange = this.handlePostChange.bind(this)
  }

  handlePostChange(event) {
    const content = this.filter.clean(event.target.value)
    this.setState(() => {
      return {
        content,
      }
    })
  }

  render() {
    return (
      <div />
    )
  }
}

export default CreatePost

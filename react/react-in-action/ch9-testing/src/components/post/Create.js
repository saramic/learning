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
      content: "",
      locationSelected: false
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

  handleRemoveLocation() {

  }

  onLocationSelect(location) {
    this.setState(() => ({
      location,
    }))
  }

  handleSubmit(event) {
    event.preventDefault()
    const newPost = {
      content: this.state.content
    }
    this.props.onSubmit(newPost)
    this.setState(() => ({
      content: ""
    }))
  }

  render() {
    return (
      <div />
    )
  }
}

export default CreatePost

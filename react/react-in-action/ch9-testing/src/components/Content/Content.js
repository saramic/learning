import PropTypes from "prop-types"
import React from "react"
import { Component } from "react-dom"

const Content = (props) => {
  const { post } = props
  return (
    <div className="content">
      { post.content }
    </div>
  )
}

Content.propTypes = {
  post: PropTypes.object,
}

export default Content

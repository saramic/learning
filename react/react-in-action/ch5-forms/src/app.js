import React, { Component } from "react"
import * as API from "./shared/http"
import CreatePost from "./components/post/Create"
import orderBy from "lodash/orderBy"

export default class App extends Component {
  constructor(props) {
    super(props)
    this.state = {
      posts: []
    }
    this.createNewPost = this.createNewPost.bind(this)
  }
  createNewPost(post) {
    this.setState(prevState => {
      return {
        posts: orderBy(prevState.posts.concat(newPost), "date", "desc")
      }
    })
  }
  render() {
    return (
      <div className="app">
        <CreatePost onSubmit={this.createNewPost} />
      </div>
    )
  }
}

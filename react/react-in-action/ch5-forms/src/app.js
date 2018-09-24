import React, { Component } from "react"
import * as API from "./shared/http"
import CreatePost from "./components/post/Create"
import orderBy from "lodash/orderBy"

export default class App extends Component {
  constructor(props) {
    super(props)
    this.state = {
      error: null,
      posts: []
    }
    this.createNewPost = this.createNewPost.bind(this)
  }
  createNewPost(post) {
    return API.createPost(post)
      .then(res => res.json())
      .then(newPost => {
        this.setState(prevState => {
          return {
            posts: orderBy(prevState.posts.concat(newPost), "date", "desc")
          }
        })
      })
      .catch(err => {
        this.setState(() => ({ error: err }))
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

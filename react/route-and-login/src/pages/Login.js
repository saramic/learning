import React, { Component } from 'react'

export class Login extends Component {
  constructor(props) {
    super(props)
    this.state = {
      email: '',
      password: '',
    }
  }

  validateForm() {
    return this.state.email.length > 0 && this.state.password.length > 0
  }

  handleChange = event => {
    this.setState({
      [event.target.id]: event.target.value
    })
  }

  handleSubmit(event) {
    event.preventDefault()
  }

  render() {
    return (
      <div className="login">
        <form onSubmit={this.handleSubmit}>
          <input
            autoFocus
            id="email"
            type="email"
            value={this.state.email}
            onChange={this.handleChange}
          />
          <input
            id="password"
            type="password"
            value={this.state.password}
            onChange={this.handleChange}
          />
          <button disabled={!this.validateForm()} type="submit">
            login
          </button>
        </form>
      </div>
    )
  }
}

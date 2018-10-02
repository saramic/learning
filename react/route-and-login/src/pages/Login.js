import React, { Component } from 'react'
import axios from 'axios'

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

  handleSubmit = async event => {
    event.preventDefault()

    try {
      const url = "http://localhost:9292/auth/login"
      const formData = new FormData()
      formData.append('email', this.state.email)
      formData.append('password', this.state.password)
      const options = { headers: { 'Content-Type': 'multipart/form-data' } };

      await axios.post(url, formData, options)
    } catch (e) {
      alert(e.message);
    }
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

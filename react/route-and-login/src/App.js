import React, { Component } from 'react';
import './App.css';
import Home from './pages/Home'
import Secret from './pages/Secret'
import { Login } from './pages/Login'
import { BrowserRouter, Switch, Route, Redirect } from "react-router-dom"

class App extends Component {
  loggedIn = () => {
    return false
  }

  render() {
    return (
      <div className="App">
        <BrowserRouter>
          <Switch>
            <Route exact path="/" component={Home} />
            <Route exact path="/login" component={Login} />
            <Route exact path="/secret" render={() => (
              this.loggedIn ? (
                <Redirect to="/login" />
              ) : (
                <Secret />
              )
            )} />
          </Switch>
        </BrowserRouter>
      </div>
    );
  }
}

export default App;

import React, { Component } from 'react';
import './App.css';
import Home from './pages/Home'
import Secret from './pages/Secret'
import { BrowserRouter as Router, Switch, Route } from "react-router-dom"

class App extends Component {
  render() {
    return (
      <div className="App">
        <Router>
          <Switch>
            <Route exact path="/" component={Home} />
            <Route path="/secret" component={Secret} />
          </Switch>
        </Router>
      </div>
    );
  }
}

export default App;

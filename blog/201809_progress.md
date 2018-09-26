# Progress Sep 2018

* Wed 26th
  - React In Action
    - Ch9 testing
      create a new project for testing from scratch

    - **set things up**
      ```
      mkdir ch9-testing
      cd ch9-testing

      yarn init

      yarn add react react-dom
      yarn add --dev @babel/core @babel/preset-env @babel/preset-react babel-loader babel-plugin-transform-class-properties
      yarn add --dev webpack webpack-dev-server webpack-cli
      yarn add --dev jest

      # using yarn with babel7 https://jestjs.io/docs/en/getting-started.html#using-babel
      yarn add --dev babel-jest 'babel-core@^7.0.0-0' @babel/core regenerator-runtime
      ```
    - **create necessary files**
      ```
      cat >> webpack.config.js
      module.exports = {
        module: {
          rules: [
            {
              loaders: [       
                'babel-loader',
              ],
              exclude: /node_modules/,
            },
          ],
        },
      }

      cat >> .babelrc
      {
        "presets": ["@babel/preset-react"]
      }

      cat >> index.html
      <div id="root" />
      <script type="text/javascript" src="main.js"></script>

      cat >> src/index.js
      import React, { Component } from "react"
      import { render } from "react-dom"

      class App extends Component {
        render() {
          return (
            <div className="app">
              hello
            </div>
          )
        }
      }

      render(
        <App />,
        document.getElementById("root")
      )
    - **setup start and test**
      ```
      vi package.json
        "scripts": {
          "start": "webpack-dev-server --mode production --watch",
          "test": "jest --coverage",
          "test:w": "jest --watch --coverage",
        },
      ```
    - **start and test**

      ```
      yarn start
      yarn test:w
      ```

    - **Basic test working**
    - **Start using enzyme shallow rendering**
      ```
      yarn add --dev enzyme enzyme-adapter-react-16
      ```

* Mon 24th
  - React In Action
    - ch5 forms
      - built from scratch and found a typo in webpack config which meant it
        was not used.

* Sun 23rd
  - React In Action
    - ch4 mounting a component
    - unmounting
    - errors
    - summary for mounting and updating across initial, will and did

* Sat 22nd
  - React In Action
    - minimal react via webpack project `react/react-in-action/ch3-data-flow`
      ```
      md ch3-data-flow
      cd ch3-data-flow

      yarn init
      yarn add react react-dom
      yarn add --dev @babel/core @babel/preset-env
      yarn add --dev webpack webpack-dev-server webpack-cli

      vi package.json
        "scripts": {
          "start": "webpack-dev-server --mode production --watch"
        },

      # use default locations for
      # index.html
      # referencing main.js
      # with JS source in src/index.js

      yarn start
      ```

    - add JSX
      ```
      yarn add --dev babel-loader
      yarn add --dev @babel/preset-react

      cat >> .babelrc
      {
        "presets": ["@babel/preset-react"]
      }

      cat >> webpack.config.js
      module.exports = {
        module: {
          rules: [
            {
              loaders: [
                'babel-loader',
              ],
              exclude: /node_modules/,
            },
          ],
        },
      }

      ```

    - Ch3 shallow merge
      - demo that shallow merge not good for state

    - Ch3 PropTypes and immutable props

    - Ch3 lightweight functional components

    - Ch4 started on lifecycle methods

  - Read - [Can blockchain technology bolster global trade?](https://www.linkedin.com/pulse/can-blockchain-technology-bolster-global-trade-vaishali-naroola/)
    - some interesting ideas around blockchain use but as one of the comments
      says nothing really of substance to be an immediate win, need people to
      change the way they do things.
    - worth chasing up some of the companies doing things in the space
      - [ ] Maersk and IBM’s joint venture to create a blockchain to support global trade.
      - [ ] Accenture, shipping line APL + a blockchain solution to streamline
        the bill of lading process.
      - [ ] Shipment management software provider CargoSmart has developed a
        blockchain solution in partnership with Oracle for shipping related
        documentation.

  * Jul update
    - ¯\_(ツ)_/¯
  * Aug update
    - Datathon on Myki transactions - https://github.com/saramic/republic-of-data

  * Sep update
    - took another look and some interest in exercisms
    - GovHack - https://github.com/saramic/govhack-2018-team-101
    - working on talk "outside in BDD"
      - https://github.com/saramic/layered-testing-workshop
      - https://github.com/saramic/images-2-text
      - react in action book
    - focus on build and release https://github.com/saramic/build-that-app


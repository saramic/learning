# Progress Sep 2018

* Sun 23rd
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

      cat >> wepack.config.js
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

    - Ch3

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

* Sat 22nd

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


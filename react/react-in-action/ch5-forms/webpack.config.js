const webpack = require("webpack")
const config = require("config")

const GLOBALS = {
  "process.env": {
    ENDPOINT: JSON.stringify(config.get('ENDPOINT'))
  }
}

module.exports = {
  plugins: [
    new webpack.DefinePlugin(GLOBALS),
  ],
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

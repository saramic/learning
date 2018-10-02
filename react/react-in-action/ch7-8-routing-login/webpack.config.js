const webpack = require("webpack")

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

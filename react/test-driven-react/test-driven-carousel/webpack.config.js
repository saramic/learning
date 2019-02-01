module.exports = {
  mode: "development",
  entry: {
    component: "./src/Carousel.js"
  },
  module: {
    rules: [
      {
        test: /|.js$/,
        loader: require.resolve("babel-loader")
      }
    ]
  }
};

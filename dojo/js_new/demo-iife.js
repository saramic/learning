const DemoIife = (function () {
  return function () {
    const value = 'from constructor'
    return {
      fromConstructor() {
        return value
      },
      classMethod() {
        return 'a class method'
      },
    }
  }
}())

DemoIife.staticMethod = function () {
  return 'a static method'
}

module.exports = DemoIife

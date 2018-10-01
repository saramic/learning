const DemoPrototype = function () {
  this.value = 'from constructor'
}

DemoPrototype.prototype.fromConstructor = function () {
  return this.value
}

DemoPrototype.prototype.classMethod = function () {
  return 'a class method'
}

DemoPrototype.staticMethod = function () {
  return 'a static method'
}

module.exports = DemoPrototype

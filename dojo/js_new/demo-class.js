class DemoClass {
  constructor() {
    this.value = 'from constructor'
    this.classMethodValue = 'a class method'
  }

  fromConstructor() {
    return this.value
  }

  classMethod() {
    return this.classMethodValue
  }

  static staticMethod() {
    return 'a static method'
  }
}

module.exports = DemoClass

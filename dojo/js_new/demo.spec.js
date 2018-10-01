import DemoPrototype from './demo-prototype';
import DemoClass from './demo-class';
import DemoIife from './demo-iife';

describe('DemoPrototype', () => {
  const demo = new DemoPrototype();

  test('valu from constructor', () => {
    expect(demo.fromConstructor()).toEqual('from constructor');
  });

  test('class method', () => {
    expect(demo.classMethod()).toEqual('a class method');
  });

  test('static method', () => {
    expect(DemoPrototype.staticMethod()).toEqual('a static method');
  });
});

describe('DemoClass', () => {
  const demo = new DemoClass();

  test('valu from constructor', () => {
    expect(demo.fromConstructor()).toEqual('from constructor');
  });

  test('class method', () => {
    expect(demo.classMethod()).toEqual('a class method');
  });

  test('static method', () => {
    expect(DemoClass.staticMethod()).toEqual('a static method');
  });
});

describe('DemoIife', () => {
  const demo = new DemoIife();

  test('valu from constructor', () => {
    expect(demo.fromConstructor()).toEqual('from constructor');
  });

  test('class method', () => {
    expect(demo.classMethod()).toEqual('a class method');
  });

  test('static method', () => {
    expect(DemoIife.staticMethod()).toEqual('a static method');
  });
});

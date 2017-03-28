# ES6 Dojo

In light of running an ES6 dojo I thought I would document the setup steps.

* create a directory and a base npm/yarn `package.json`

    ```bash
    mkdir dojo
    cd dojo
    yarn init
    ```

* add all the dependencies that are going to make it ES6

    ```bash
    yarn add --dev babel-cli babel-preset-latest
    ```

* and need some babel presets

    ```bash
    cat >> .babelrc
    {
      "presets": ["latest"]
    }
    ```

* add a test framework like
  [jest](https://facebook.github.io/jest/docs/getting-started.html)

    ```bash
    yarn add --dev jest
    ```

* you will want to add a test script to your package.json configuration

    ```json
    "scripts" : {
      "test": "jest"
    }
    ```
* you can now run the tests watching the directory

    ```bash
    yarn test -- --watch
    ```

* now you are ready to write some test
  (**Step 1:** start by writing a failing test)


    ```bash
    cat > foo.test.js
    import foo from './foo';

    test('should return bar', () => {
      const fooInstance = new foo;
      expect(fooInstance.bar()).toEqual('foo');
    });
    ```

* which fails

* and then you write some code which makes it pass
  (** Step 2:** minimum test to make the test pass)

    ```bash
    cat > foo.js
    export default foo => ({
      bar() {
        return 'foo';
      }
    });
    ```

* **Step 3:** finally refactor

## Class alternative

To use the new class syntax you can do something like the following

    ```bash
    cat > foo.js
    class foo {
      bar() {
        return 'foo';
      }
    }
    export default foo;
    ```


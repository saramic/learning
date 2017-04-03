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

* and need some babel presets in package.json

    ```json
		...
    "babel": {
      "presets": [
        "latest"
      ]
    },
		...
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

or with a constructor

    ```bash
    cat > foo.js
    class Foo {
      constructor() {
        this.fooStr = 'foo';
      }

      bar() {
        return this.fooStr;
      }
    }

    export default Foo;
    ```
## Wire into a React app

```bash
 npm install -g create-react-app
 create-react-app react-foo
 cd react-foo
 yarn start
 ```

 make sure the lib is in src `cp .../foo.js src/`

 edit `src/App.js`

 ```javascript
 import Foo from './foo';
 ...
 constructor(props) {
   super(props);
   this.fooAction = this.fooAction.bind(this);
   this.foo = new Foo();
   this.state = {
     foo: this.foo.bar()
   };
...
fooAction() {
  this.foo.fooAction();
  this.setState({
    foo: this.foo.bar()
  });
}
...
<button onClick={this.fooAction}>the foo action</button>
<span key='the-score'>{this.state.foo}</span>
...
 ```

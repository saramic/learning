# Checkers

## Running

```
# compile
wat2wasm  checkers.wat -o checkers.wasm
# or
wat2wasm  checkers.wat -o checkers.wasm

python3 -m http.server

# view in browser, and inspect the console
open http://localhost:8000/
```

```
# inspect
wasm-objdump checkers.wasm -x
```

### Demo

```
wat2wasm func_test.wat
python3 -m http.server

open http://localhost:8000/func_test.html
```

- \_watch for output in the console debug of the browser

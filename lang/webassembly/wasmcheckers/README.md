# Checkers

## Running

```
# compile
wat2wasm checkers.wasm

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

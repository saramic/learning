# fundemental webassembly

## Running

```
wat2wasm add1.wat -o add.wasm
wat2wasm add2.wat -o add_sexpr.wasm

# next
wasm-objdump add.wasm -x

# roundtrip
wasm2wat add_sexpr.wasm -o roundtrip.wat
```

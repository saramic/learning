# Bindgen hello

```
cargo new bindgenhello --lib
cd bindgenhello/

# compile and bindgen
cargo build --target wasm32-unknown-unknown
wasm-bindgen target/wasm32-unknown-unknown/debug/bindgenhello.wasm  --out-dir .

# serve
npm run serve
```

## install

bindgen

```
cargo install wasm-bindgen-cli

# npm dev dependencies
npm add --only=dev    \
  text-encoding       \
  html-webpack-plugin \
  webpack webpack-cli \
  webpack-dev-server
```

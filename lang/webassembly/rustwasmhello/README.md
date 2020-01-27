# Rust to WASM demo

```
rustup toolchain list
rustup target list
# add wasm target
rustup target add  wasm32-unknown-unknown

# build
cargo build --target wasm32-unknown-unknown

# build release
cargo build --release --target=wasm32-unknown-unknown

# inspect release to see the add_one function is exposed
wasm-objdump -x target/wasm32-unknown-unknown/release/rustwasmhello.wasm
```


# Rusty checkers

## Running

```
cargo build --release --target wasm32-unknown-unknown
cp target/wasm32-unknown-unknown/release/rustycheckers.wasm  demo/

cd demo
python3 -m http.server
open http://localhost:8000/
# watch the console
```

## Version issues

needed the right version of RLS which did not compile on the nightly build I had so I had to start using `stable`

```
rustup toolchain install stable-x86_64-apple-darwin
rustup default stable-x86_64-apple-darwin

# now RLS will install
rustup component add rls rust-analysis rust-src

# and run in VSCode for formatting etc

# again add wasm32 for this stable version
rustup target add wasm32-unknown-unknown
```

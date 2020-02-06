# Mine Demo

Proof of work by "mining" for a sha256 hash begnning with 5 0's

## Running

JS in console

```
npm run serve

open http://localhost:8080/

# in console
console.time("jsMine"); console.log(jsMine("hello")); console.timeEnd("jsMine")
```

Rust from commandline

```
time cargo run

  0000037660ee0e22df67a053537e000325bbfad2cce9b8b7c795f6aa961d5cb7

  real	0m3.708s
  user	0m3.621s
  sys	0m0.039s
```

Rust as WASM

**Note:** rust_mine is broken and does not read the input argument so it is
basically always running rust_mine("")

```
# in console
console.time("rustMine"); rustMine.then(rm => {console.log(rm.rust_mine("hello"));  console.timeEnd("rustMine"); });
```

Pure WAST

_... todo_

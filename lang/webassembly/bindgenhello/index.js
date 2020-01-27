const wasm = import("./bindgenhello");

wasm.then(h => h.hello("world!")).catch(console.error);

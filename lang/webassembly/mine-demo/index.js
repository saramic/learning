import * as crypto from "crypto";

import { WasmMine } from "./mine_demo";

const wrapLogAndOutput = (callFunction, args, divId) => {
  window.requestAnimationFrame(() => {
    const outputElement = document.getElementById(divId);
    outputElement.innerHTML = "...";
    window.requestAnimationFrame(() => {
      const start = new Date().getTime();
      const answer = callFunction(args);
      const end = new Date().getTime();
      const answer_timed = Object.assign(answer, { time: end - start });
      console.log(answer_timed);
      outputElement.innerHTML = JSON.stringify(answer_timed);
    });
  });
};

const jsMine = text => {
  let hash = "";
  let nonce = 0;
  do {
    hash = crypto
      .createHash("sha256")
      .update(text + ++nonce)
      .digest("hex");
  } while (hash.startsWith("00000") === false);
  return { nonce: nonce, hash: hash };
};

const hashThis = text => {
  return crypto
    .createHash("sha256")
    .update(text)
    .digest("hex");
};

// using browser fetch the alternative would be file system loading
//   const fs = require("fs");
//   const wasm = fs.readFileSync(`${__dirname}/sha256.wasm`);
//   const sha256m = new WebAssembly.Module(wasm);
fetch("./wast_mine.wasm")
  .then(response => response.arrayBuffer())
  .then(bytes => WebAssembly.instantiate(bytes, {}))
  .then(results => {
    let hash = results.instance.exports;
    hash.final();
    console.log("loaded WAST module");
    // I think I have a sha256 being returned here
    console.log(Buffer.from(hash.memory.buffer.slice(0, hash.hashsize)));
    // but how to decode it and make it available outside of this then block?
    //   class sha256 {
    //     constructor() {
    //       this.hash = new WebAssembly.Instance(sha256m).exports;
    //     }
    //     update(buffer) {
    //       while (this.hash.memory.buffer.byteLength - this.hash.offset < buffer.length) {
    //         this.hash.memory.grow(1);
    //       }
    //       new Uint8Array(this.hash.memory.buffer, this.hash.offset).set(buffer);
    //       this.hash.update(this.hash.offset, buffer.length);
    //       return this;
    //     }
    //     digest() {
    //       this.hash.final();
    //       return Buffer.from(this.hash.memory.buffer.slice(0, this.hash.hashsize));
    //     }
    //   }

    // and presumably use it as such
    //   if (typeof require === "function" && require.main === module) {
    //     const names = process.argv.slice(2);
    //     names.forEach(name => {
    //       const rs = fs.createReadStream(name);
    //       //const hash = require("crypto").createHash("sha256");
    //       const hash = new sha256();
    //       const bufsize = 64 * 1024;
    //       rs.on("readable", _ => {
    //         let buf = null;
    //         while ((buf = rs.read(bufsize))) {
    //           hash.update(buf);
    //         }
    //       });
    //       rs.on("end", _ => {
    //         const digest = hash.digest();
    //         console.log(`${digest.toString("hex")}  ${name}`);
    //       });
    //     });
    //   } else if (typeof module !== "undefined") {
    //     module.exports = sha256;
    //   }
  })
  .catch(console.error);

export default { wrapLogAndOutput };
window.jsMine = jsMine;
window.hashThis = hashThis;
window.WasmMine = WasmMine;
window.wrapLogAndOutput = wrapLogAndOutput;

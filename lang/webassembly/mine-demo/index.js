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

export default { wrapLogAndOutput };
window.jsMine = jsMine;
window.hashThis = hashThis;
window.WasmMine = WasmMine;
window.wrapLogAndOutput = wrapLogAndOutput;

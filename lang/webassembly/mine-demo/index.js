import * as crypto from "crypto";

const wasmMine = import("./mine_demo_bg");

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

window.jsMine = jsMine;
window.hashThis = hashThis;
window.wasmMine = wasmMine;

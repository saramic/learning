import * as crypto from "crypto";

const jsMine = text => {
  let hash = "";
  let nonce = 0;
  do {
    hash = crypto
      .createHash("sha256")
      .update(text + ++nonce)
      .digest("hex");
  } while (hash.startsWith("00000") === false);
  return [nonce, hash];
};

window.jsMine = jsMine;
// console.log(jsMine("hello"));

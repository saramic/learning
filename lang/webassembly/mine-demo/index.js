import * as crypto from "crypto";

const rustMine = import("./mine_demo_bg");

const jsMineClick = text => {
  return new Promise(resolve => {
    const start = new Date().getTime();
    var answer = jsMine(text);
    const end = new Date().getTime();
    resolve(Object.assign(answer, { time: end - start }));
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

window.jsMine = jsMine;
window.jsMineClick = jsMineClick;
window.hashThis = hashThis;
window.rustMine = rustMine;
// console.log(jsMine("hello"));

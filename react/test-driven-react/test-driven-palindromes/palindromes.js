module.exports = str => {
  const returnChr = str.replace(/\W/g, "").toLowerCase();
  return returnChr ===
    returnChr
      .split("")
      .reverse()
      .join("")
    ? [returnChr]
    : [];
};

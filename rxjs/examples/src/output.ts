export default (string) => {
  const outputList = document.querySelector("#output");
  const liElem = document.createElement('li');
  const newContent = document.createTextNode(string);
  liElem.appendChild(newContent);
  outputList.appendChild(liElem);
}

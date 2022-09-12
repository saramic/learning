import { beforeEach, describe, expect, it } from 'vitest'
import { JSDOM } from 'jsdom'
import fs from "fs"
import path from "path"

// could use fireEvent from testing-library
// import { fireEvent } from '@testing-library/dom'
// from https://stackoverflow.com/a/35041560/1564635
function eventFire(element, eventType){
  if (element.fireEvent) {
    element.fireEvent('on' + eventType);
  } else {
    var eventObj = dom.window.document.createEvent('Events');
    eventObj.initEvent(eventType, true, false);
    element.dispatchEvent(eventObj);
  }
}

// document construction heavily based on
// https://dev.to/thawkin3/how-to-unit-test-html-and-vanilla-javascript-without-a-ui-framework-4io
const html = fs.readFileSync(
  path.resolve(__dirname, "./index.html"), "utf8"
);
let dom
let container

describe("index.html integration", () => {
  beforeEach(() => {
    dom = new JSDOM(html, { runScripts: "dangerously"})
    container = dom.window.document.body
  })

  it("renders a form", () => {
    const form = container.querySelector("body form")
    expect(form ).toMatchInlineSnapshot(`
      <form
        data-testid="the-form"
      >
        
          
        <div
          data-testid="message"
        />
        
          
        <input
          type="text"
        />
        
          
        <input
          type="submit"
        />
        
        
      </form>
    `)
  })

  it("clicking submit by default returns an invalid message", () => {
    const submitButton = container.querySelector("form[data-testid=the-form] input[type=\"submit\"]")
    eventFire(submitButton, "click")
    expect(container.querySelector("[data-testid=message]").textContent).toBe("Input is invalid")
  })

  it("clicking submit with valid input returns a valid message", () => {
    const textInput = container.querySelector("form[data-testid=the-form] input[type=\"text\"]")
    textInput.value = "123"
    const submitButton = container.querySelector("form[data-testid=the-form] input[type=\"submit\"]")
    eventFire(submitButton, "click")
    expect(container.querySelector("[data-testid=message]").textContent).toBe("All is good")
  })
})

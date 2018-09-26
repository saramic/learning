import React from "react"
import ShallowRenderer from "react-test-renderer/shallow"
import Content from "./Content"

describe("<Content />", () => {
  test("should render correctly", () => {
    const renderer = new ShallowRenderer()
    renderer.render(<Content />)
    const result = renderer.getRenderOutput()
    expect(result.type).toBe('div')
    expect(result.props.children).toEqual('hello content')
  })
})

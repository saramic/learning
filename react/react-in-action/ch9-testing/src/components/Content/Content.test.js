import React from "react"
import ShallowRenderer from "react-test-renderer/shallow"
import renderer from "react-test-renderer"
import { shallow } from "enzyme"
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

describe("<Content />", () => {
  test("should render correctly", () => {
    const wrapper = shallow(<Content />)
    expect(wrapper.find('div').length).toBe(1)
    expect(wrapper.find('div').text()).toBe("hello content")
  })
})

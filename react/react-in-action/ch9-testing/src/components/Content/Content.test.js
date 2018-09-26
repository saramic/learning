import React from "react"
import ShallowRenderer from "react-test-renderer/shallow"
import renderer from "react-test-renderer"
import { shallow } from "enzyme"
import Content from "./Content"

describe("<Content />", () => {
  test("should render correctly", () => {
    const mockPost = {
      content: "hello content"
    }
    const renderer = new ShallowRenderer()
    renderer.render(<Content post={mockPost}/>)
    const result = renderer.getRenderOutput()
    expect(result.type).toBe('div')
    expect(result.props.children).toEqual('hello content')
  })
})

describe("<Content />", () => {
  test("should render correctly", () => {
    const mockPost = {
      content: "I am learning to test react components"
    }
    const wrapper = shallow(<Content post={mockPost} />)
    expect(wrapper.find('div').length).toBe(1)
    expect(wrapper.find('div').text()).toBe(mockPost.content)
  })

  test("snapshot", () => {
    const mockPost = {
      content: "I am learning to test react components"
    }
    const component = renderer.create(<Content post={mockPost} />)
    const tree = component.toJSON()
    expect(tree).toMatchSnapshot()
  })
})

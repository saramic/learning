import React from "react"
import renderer from "react-test-renderer"

import CreatePost from "./Create"

describe("CreatePost", () => {
  test("snapshot", () => {
    const props = { onSubmit: jest.fn() }
    const component = renderer.create(<CreatePost {...props} />)
    const tree = component.toJSON()
    expect(tree).toMatchSnapshot()
  })
  test("handlePostChange", () => {
    const props = { onSubmit: jest.fn() }
    const mockEvent = { target: { value: "value" } }
    CreatePost.prototype.setState = jest.fn(function(updater) {
      this.state = Object.assign(this.state, updater(this.state))
    })

    const component = new CreatePost(props)
    component.handlePostChange(mockEvent)
    expect(component.setState).toHaveBeenCalled()
    expect(component.setState.mock.calls.length).toEqual(1)
    expect(component.state).toEqual({
      content: "value",
      locationSelected: false,
    })
  })
  test("handleSubmit", () => {
    const props = { onSubmit: jest.fn() }
    const mockEvent = {
      target: { value: "value" },
      preventDefault: jest.fn()
    }
    CreatePost.prototype.setState = jest.fn(function(updater) {
      this.state = Object.assign(this.state, updater(this.state))
    })

    const component = new CreatePost(props)
    // simulate user entering state
    component.setState(() => ({
      content: "content"
    }))
    component.handleSubmit(mockEvent)
    expect(component.setState).toHaveBeenCalled()
    // onSubmit called with the user entered content
    expect(props.onSubmit).toHaveBeenCalledWith({
      content: "content"
    })
    // state should now be reset
    expect(component.state).toEqual({
      content: "",
      locationSelected: false,
    })
  })
  test('handleRemoveLocation', () => {
    const props = { onSubmit: jest.fn() }
    CreatePost.prototype.setState = jest.fn(function(updater) {
      this.state = Object.assign(this.state, updater(this.state))
    })
    const component = new CreatePost(props)
    component.handleRemoveLocation()
    expect(component.state.locationSelected).toEqual(false)
  })
  test('onLocationSelect', () => {
    const props = { onSubmit: jest.fn() }
    CreatePost.prototype.setState = jest.fn(function(updater) {
      this.state = Object.assign(this.state, updater(this.state))
    })
    const component = new CreatePost(props)
    component.onLocationSelect({
      lat: 1,
      lng: 2,
      name: 'name',
    })
    expect(component.setState).toHaveBeenCalled()
    expect(component.state.location).toEqual({
      lat: 1,
      lng: 2,
      name: 'name',
    })
  })
  test('renderLocationControls', () => {
    const props = { onSubmit: jest.fn() }
    const component = renderer.create(<CreatePost {...props} />)
    let tree = component.toJSON()
    expect(tree).toMatchSnapshot()
  })
})

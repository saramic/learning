import App from '../../src/App';

describe('App', () => {
  it('renders', () => {
    cy.mount(<App />)
    cy
      .get(".App-link")
      .invoke("text")
      .should("equal", "Learn React")
  })
})
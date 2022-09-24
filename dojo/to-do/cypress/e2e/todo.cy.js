describe('empty spec', () => {
  it('passes', () => {
    cy.visit('/')
    cy
      .get(".App-link")
      .invoke("text")
      .should("equal", "Learn React")
    cy
      .get(".App-link").click()
  })
})
describe('Button Click Test', () => {
  it('should increment the counter on button click', () => {
    // Visitar a página inicial onde o botão está presente
    cy.visit('/');

    // Verificar se o contador inicial é 0
    cy.contains('span', 'click counter is 0').should('be.visible');

    cy.get('button').contains('hello').click();

    cy.contains('span', `click counter is 1`).should('be.visible');

    cy.contains('span', 'click counter is 0').should('not.exist');

    // Clicar no botão que diz 'hello'
    for (let i = 2; i <= 3; i++) {
      cy.get('button').contains('hello').click();
      // Verificar se o contador mudou para i após o clique
      cy.contains('span', `click counter is ${i}`).should('be.visible');
    }

    
  });
});

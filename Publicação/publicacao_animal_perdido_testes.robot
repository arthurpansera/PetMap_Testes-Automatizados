*** Settings ***
Documentation    Testes automatizados para a publicação de casos de animal perdido no sistema.
Resource    publicacao_animal_perdido_resources.robot    
Test Setup    Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
CT09 - Manter publicação de caso de animal perdido
    [Documentation]    Teste do fluxo completo de publicação de animal perdido
    [Tags]    publicacao_animal_perdido
    Realizar login
    Usuário acessa a página principal
    Clicar no botão de realizar publicação no canto inferior direito
    O sistema exibe o formulário de nova publicação
    Preencher o formulário da publicação
    O sistema aceita as informações inseridas
    Clicar no botão Publicar
    O sistema registra a publicação
    Deve ser exibida uma mensagem de sucesso e o sistema deve manter o usuário na página principal